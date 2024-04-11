import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/color_constants.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  bool isLoading = true;
  String locationMessage = 'Current Location of user';
  late bool serviceEnabled = false;
  late LocationPermission permission;
  Position? _currentUserLocation;
  String currentAddress = '';
  String placeLoc = '';
  String placeAdm = '';
  String currentStreet = '';
  double? distanceInMeters = 0.0;
  double? distanceInKm = 0.0;
  double userLatitude = 0.0;
  double userLongitude = 0.0;
  LatLng? coordinates;

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
        placeLoc = '${place.locality}';
        placeAdm = '${place.country}';
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

  Future<Position?> _updateMapCenter() async {
    coordinates = await _addressFromCoordinates();

    if (coordinates != null) {
      setState(() async {
        initialCenter = coordinates!;
      });
    } else {
      print("Error occurred while getting coordinates");
    }
    return null;
  }

  List<LatLng> points = [
    const LatLng(37.7749, -122.4194),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: () {
          Get.to(() => const MapPage());
        },
        child:
            /* Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black12,
              ),
            ],
          ),
          child:*/
            Container(
          width: double.infinity,
          height: 175,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                    child: Text(
                      "Sakaman, Blue Lagoon Street 34",
                      style: TextStyle(
                        fontSize: 10,
                        //color: tertiaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    leading: Image.asset(
                      "assets/icons/oncoming_police.png",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Weija Gbawe Municipal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    subtitle: const Text(
                      "(+233) 0245513607",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                    trailing: const Text(
                      "GHC50",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8),
                child: MaterialButton(
                  height: 60,
                  minWidth: double.infinity,
                  color: primaryColor,
                  onPressed: () {},
                  child: const Text(
                    "Call for emergency now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: FlutterMap(
              options: MapOptions(
                keepAlive: true,
                // 5.7931065, -0.7893054
                initialCenter: initialCenter,
                initialZoom: 10.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      strokeCap: StrokeCap.round,
                      points: [
                        LatLng(userLatitude, userLongitude),
                        const LatLng(7.33991, -2.32676),
                      ],
                      strokeWidth: 4,
                      color: Colors.blue,
                    ),
                  ],
                ),
                MarkerLayer(
                  alignment: Alignment.center,
                  markers: [
                    Marker(
                      point: // initialCenter,
                          //const LatLng(5.7931065, -0.7893054),
                          LatLng(userLatitude, userLongitude),
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
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/images/img2.png"),
                                            ),
                                            title: const Text(
                                              "Sandra Smith",
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Text(
                                                  placeLoc,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  placeAdm,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: const Text("24 years"),
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .favorite_outline_rounded,
                                                    size: 13,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    "Married",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.work_history_outlined,
                                                    size: 13,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    "Nurse",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.people_alt_outlined,
                                                    size: 13,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    "3 Children",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 3),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
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
                                color: Colors.red,
                              ),
                              child: const Icon(
                                Icons.person_pin,
                                size: 23,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Marker(
                      point: // initialCenter,
                          //const LatLng(5.7931065, -0.7893054),
                          const LatLng(7.33991, -2.32676),
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
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            leading: const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/images/img2.png"),
                                            ),
                                            title: const Text(
                                              "Sandra Smith",
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Text(
                                                  placeLoc,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  placeAdm,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: const Text("24 years"),
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .favorite_outline_rounded,
                                                    size: 13,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    "Married",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.work_history_outlined,
                                                    size: 13,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    "Nurse",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.people_alt_outlined,
                                                    size: 13,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    "3 Children",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 3),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/icons/round_pushpin_100px.png",
                              height: 50,
                              width: 50,
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

            // Loading indicator overlay
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          /* Positioned(
            left: 20,
            bottom: 20,
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: tertiaryColor,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineIcons.phone,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "Call Emergency Now",
                    style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        */
        ],
      ),
    );
  }
}
