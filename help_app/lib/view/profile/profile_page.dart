import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants/color_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
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
      */
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/img4.png",
                    ),
                  ),
                  title: Text(
                    "Dr. John Smith",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 0.5,
                color: Colors.grey,
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      CupertinoIcons.person,
                    ),
                  ),
                ),
                title: const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      CupertinoIcons.bell,
                    ),
                  ),
                ),
                title: const Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.privacy_tip_outlined,
                    ),
                  ),
                ),
                title: const Text(
                  "Privacy",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.settings_suggest_outlined,
                    ),
                  ),
                ),
                title: const Text(
                  "General",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      CupertinoIcons.info,
                    ),
                  ),
                ),
                title: const Text(
                  "About us",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              const Divider(
                height: 40,
                thickness: 0.5,
                indent: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent.shade100,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.logout,
                    ),
                  ),
                ),
                title: const Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text(
                      "HappyHelp v1.2",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
