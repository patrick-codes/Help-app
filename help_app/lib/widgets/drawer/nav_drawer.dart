import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/view/profile/profile_page.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          /*const UserAccountsDrawerHeader(
            accountName: Text(
              "",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            accountEmail: Text(
              "",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            currentAccountPictureSize: Size.square(60),
            decoration: BoxDecoration(
              color: primaryColor,
              image: DecorationImage(
                image: AssetImage("assets/images/img1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          */
          ListTile(
            selectedColor: secondaryColor,
            selectedTileColor: secondaryColor,
            leading: const Icon(
              LineIcons.phone,
              color: secondaryColor,
            ),
            title: const Text(
              "Contact & Enquiries",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              LineIcons.folder,
              color: secondaryColor,
            ),
            title: const Text(
              "Upcoming Programs",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              LineIcons.peopleCarry,
              color: secondaryColor,
            ),
            title: const Text(
              "Donate Offering",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {
              //Get.to(() => const DonationPage());
            },
          ),
          ListTile(
            leading: const Icon(
              LineIcons.anchor,
              color: secondaryColor,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {
              Get.to(() => const ProfilePage());
            },
          ),
          ListTile(
            leading: const Icon(
              LineIcons.user,
              color: secondaryColor,
            ),
            title: const Text(
              "Developer",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {
              // Get.to(() => const DeveloperPage());
            },
          ),
          ListTile(
            leading: const Icon(
              LineIcons.addressBook,
              color: secondaryColor,
            ),
            title: const Text(
              "About Us",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              LineIcons.alternateSignOut,
              color: secondaryColor,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 80),
          /*Container(
            alignment: Alignment.bottomCenter,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Copyright",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 10,
                      ),
                    ),
                    Icon(
                      LineIcons.copyright,
                      color: secondaryColor,
                      size: 13,
                    ),
                    Text(
                      "pensa aamusted",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  "Developed by Kofik Technology Ghana Accra",
                  style: TextStyle(fontSize: 10, color: secondaryColor),
                ),
                Text(
                  "www.kofiktechgh.com",
                  style: TextStyle(
                    color: tertiaryColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          */
          /*Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => DonationPage());
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Donate Offering",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      LineIcon(
                        LineIcons.donate,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        */
        ],
      ),
    );
  }
}
