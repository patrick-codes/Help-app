import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/color_constants.dart';
import 'package:latlong2/latlong.dart';

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
      return LatLng(userLatitude, userLongitude);
    } catch (e) {
      print(e);
      // Return null or handle the error accordingly
      return null;
    }
  }

  LatLng initialCenter = const LatLng(0.0, 0.0); // Default initial center

  Future<void> _updateMapCenter() async {
    LatLng? coordinates = await _addressFromCoordinates();

    if (coordinates != null) {
      setState(() {
        initialCenter = coordinates;
      });
    } else {
      // Handle the case where an error occurred in the _addressFromCoordinates function
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
                /*interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all,
                  debugMultiFingerGestureWinner: false,
                  enableMultiFingerGestureRace: false,
                  rotationThreshold: 20.0,
                  rotationWinGestures: MultiFingerGesture.rotate,
                  pinchZoomThreshold: 0.5,
                  pinchZoomWinGestures: MultiFingerGesture.pinchZoom |
                      MultiFingerGesture.pinchMove,
                  pinchMoveThreshold: 40.0,
                  pinchMoveWinGestures: MultiFingerGesture.pinchZoom |
                      MultiFingerGesture.pinchMove,
                  enableScrollWheel: true,
                ),*/
              ),
              children: [
                TileLayer(
                  //'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  //'http://tile.stamen.com/toner/{z}/{x}/{y}.png'
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: const LatLng(5.5768149, -0.3266899),
                      width: 34,
                      height: 35,
                      child: Builder(
                        builder: (BuildContext context) {
                          return Container(
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
                              size: 23,
                              color: Colors.red,
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
