// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/view/councellors/councellor_profile.dart';
import 'package:help_app/view/profile/profile_page.dart';
import 'package:help_app/view/councellors/scheduled_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/councellor/councellor_model_testing.dart';
import '../../widgets/customapp_bar.dart';
import '../../widgets/drawer/nav_drawer.dart';
import '../alerts_page.dart';
import '../chat/chat_page.dart';
import '../map/map_page.dart';
import 'home_page.dart';

class HomePage extends StatefulWidget {
  final String address;
  const HomePage({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await _checkAndShowLocationDisclosureDialog();
    });
  }

  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    SchedulePage(),
    const AlertPage(),
    const MapPage(),
    const ProfilePage(),
  ];

  String locationMessage = 'Current Location of user';
  late bool serviceEnabled = false;
  late LocationPermission permission;
  Position? _currentUserLocation;
  String currentAddress = '';
  String currentStreet = '';
  double? distanceInMeters = 0.0;
  double? distanceInKm = 0.0;
  double? userLatitude;
  double? userLongitude;

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
    await _addressFromCordinates();
    print(_currentUserLocation);
  }

  Future _addressFromCordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentUserLocation!.latitude, _currentUserLocation!.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentAddress =
            '${place.locality} ${place.administrativeArea}, ${place.country}';
      });
      print(currentAddress);
      print(userLatitude);
      print(userLongitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _checkAndShowLocationDisclosureDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showDialog = prefs.getBool('showLocationDisclosureDialog') ?? true;

    if (showDialog) {
      await _showLocationDisclosureDialog(prefs);
    } else {
      await _loadLocation();
    }
  }

  Future<void> _showLocationDisclosureDialog(SharedPreferences prefs) async {
    showDialog(
      barrierColor: Colors.black54,
      barrierDismissible: false,
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
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                size: 40,
                Icons.share_location,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Disclaimer',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          content: const Text(
              'This application uses device location for full functionalities and better experience. Location data is protected and not shared with any third party.'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    prefs.setBool('showLocationDisclosureDialog', false);
                    Get.back();
                    await _loadLocation();
                    //await fetchStations();
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Agree',
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Disagree',
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    //Navigator.of(context).pop();
                    Get.back();
                    _showAlertBanner('Turn device location on');
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  //Refresh page function
  Future<void> _refresh() async {
    setState(() async {
      _loadLocation();
    });
    await _loadLocation();
  }

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

  void _showExitAlertBanner(
    String message,
  ) {
    Flushbar(
      backgroundColor: Colors.black,
      icon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  final List imgs = [
    "img1.png",
    "img2.png",
    "img3.png",
    "img4.png",
    "img1.png",
    "img2.png",
    "img3.png",
    "img4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            hoverColor: tertiaryColor,
            activeColor: tertiaryColor,
            iconSize: 15,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            duration: const Duration(milliseconds: 300),
            color: secondaryColor,
            curve: Curves.linear,
            style: GnavStyle.oldSchool,
            textSize: 8,
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.calendar,
                text: 'Schedule',
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_text_fill,
                text: 'Chat',
              ),
              GButton(
                icon: LineIcons.mapAlt,
                text: 'Map',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(137),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomAppBar(
              address: 'Accra, Gbawe',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Container(
                color: primaryColor,
                height: 80,
                child: ListView.builder(
                  itemCount: councellorDetails.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    TestingCouncellorModel councellor =
                        councellorDetails[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => CouncellorProfile(
                              name: councellor.fullName,
                              profession: councellor.profession,
                              location: councellor.address,
                              fee: councellor.feeCharged,
                              isVerified: councellor.isVerified,
                              about: councellor.about,
                              review: councellor.review,
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          //textDirection: TextDirection.,
                          children: [
                            Positioned(
                              height: 13,
                              bottom: 0.5,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 14,
                                  bottom: 2,
                                  left: 5,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(),
                                  child: Text(
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    councellor.fullName!,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 55,
                                height: 55,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    "assets/images/${imgs[index]}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 40, top: 13),
                              padding: const EdgeInsets.all(3),
                              height: 13,
                              width: 13,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      /*AppBar(
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        backgroundColor: primaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              height: 40,
              width: 120,
              image: AssetImage("assets/icons/logo.png"),
            ),
            Badge(
              label: Text("2"),
              child: Icon(
                LineIcons.bell,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
      
      */
      body: RefreshIndicator(
          color: primaryColor,
          strokeWidth: 3,
          onRefresh: _refresh,
          child: pages.elementAt(_selectedIndex)),
    );
  }
}
