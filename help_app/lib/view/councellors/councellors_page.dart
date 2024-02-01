import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:help_app/view/chat_page.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants/color_constants.dart';
import '../../widgets/customapp_bar.dart';
import '../alerts_page.dart';
import '../home_page.dart';
import '../map/map_page.dart';
import '../profile/profile_page.dart';
import '../scheduled_page.dart';
import 'councellor_profile.dart';

class CouncellorsPage extends StatefulWidget {
  CouncellorsPage({super.key});

  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    SchedulePage(),
    const AlertPage(),
    const MapPage(),
    const ProfilePage(),
  ];

  @override
  State<CouncellorsPage> createState() => _CouncellorsPageState();
}

class _CouncellorsPageState extends State<CouncellorsPage> {
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
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        backgroundColor: primaryColor,
        leadingWidth: 20,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Councellors",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 8.0, right: 10),
            child: Icon(
              Icons.more_vert,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(
                height: 1,
                thickness: 0.5,
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Active Now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const ChatPage());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          textDirection: TextDirection.rtl,
                          children: [
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
                              margin: const EdgeInsets.only(right: 1, top: 13),
                              padding: const EdgeInsets.all(3),
                              height: 15,
                              width: 15,
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
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(
                height: 1,
                thickness: 0.5,
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "All Councellors & Pyschologist",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => CouncellorProfile());
                  },
                  minVerticalPadding: 15,
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/${imgs[index]}"),
                  ),
                  title: const Text(
                    "Dr. Owusu Ansah",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "Hello Dr, are you there?",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  trailing: const Text(
                    "3:30 PM",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: 330,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primaryColor,
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
              Icons.phone,
              size: 24,
              color: tertiaryColor,
            ),
            SizedBox(width: 7),
            Text(
              "CREATE PANIC CALL NOW",
              style: TextStyle(
                fontSize: 15,
                color: tertiaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
