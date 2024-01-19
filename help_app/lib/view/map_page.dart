import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/color_constants.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    _loadLocation();
    _updateMapCenter();
  }

  String locationMessage = 'Current Location of user';
  late bool serviceEnabled = false;
  late LocationPermission permission;
  Position? _currentUserLocation;
  String currentAddress = '';
  String currentStreet = '';
  double? distanceInMeters = 0.0;
  double? distanceInKm = 0.0;
  late double userLatitude;
  late double userLongitude;

  void _showAlertBanner(
    String message,
  ) {
    Flushbar(
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.cancel_rounded,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: const Duration(seconds: 5),
    ).show(context);
  }

  Future<Position> _getLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showAlertBanner('Turn on location service');

      //Get.snackbar('Turn on location', 'Location service is disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showAlertBanner('Location permission denied by device');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showAlertBanner(
          'Location permissions are permanently denied, we cannot request permission.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _loadLocation() async {
    _currentUserLocation = await _getLocation();
    await _addressFromCoordinates();
    print(_currentUserLocation);
  }

  Future<LatLng?> _addressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentUserLocation!.latitude, _currentUserLocation!.longitude);
      Placemark place = placemarks[0];

      setState(() {
        currentAddress =
            '${place.locality} ${place.administrativeArea}, ${place.country}';
        userLatitude = _currentUserLocation!.latitude;
        userLongitude = _currentUserLocation!.longitude;
      });

      print(currentAddress);
      print(userLatitude);
      print(userLongitude);

      // Return LatLng object
      return initialCenter;
    } catch (e) {
      print(e);
      // Return null or handle the error accordingly
      return null;
    }
  }

  LatLng initialCenter = const LatLng(0.0, 0.0);

  Future<void> _updateMapCenter() async {
    LatLng? coordinates = await _addressFromCoordinates();

    if (coordinates != null) {
      setState(() async {
        initialCenter = coordinates;
      });
    } else {
      print("Error occurred while getting coordinates");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          LineIcons.locationArrow,
          color: tertiaryColor,
          size: 30,
        ),
      ),
      */
      body: Stack(
        children: [
          Center(
            child: FlutterMap(
              options: MapOptions(
                keepAlive: true,
                //5.5768149, -0.3266899
                initialCenter: initialCenter,
                initialZoom: 5.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: const LatLng(5.5768149, -0.3266899),
                      child: Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8.0),
                                        bottom: Radius.circular(8),
                                      ),
                                    ),
                                    //: const Text("Current Location"),
                                    content: Text(currentAddress),
                                    /* actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                    */
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1.5,
                                    blurRadius: 2,
                                  )
                                ],
                                shape: BoxShape.circle,
                                color: primaryColor,
                              ),
                              child: const Icon(
                                Icons.location_pin,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(
                          Uri.parse('https://openstreetmap.org/copyright')),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.grey,
                    spreadRadius: 1.5,
                    blurRadius: 2,
                  )
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineIcons.phone,
                    color: tertiaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "Call Emergency Now",
                    style: TextStyle(
                        fontSize: 10,
                        color: tertiaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
