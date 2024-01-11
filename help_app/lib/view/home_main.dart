import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/view/home_page.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/drawer/nav_drawer.dart';
import 'alerts_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    const FavoritePage(),
    const AlertPage(),
    const HomeScreen(),
    const AlertPage(),
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
                icon: LineIcons.heart,
                text: 'Favorite',
              ),
              GButton(
                icon: LineIcons.phone,
                text: 'Contact',
              ),
              GButton(
                icon: LineIcons.list,
                text: 'Order',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
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
      body: pages.elementAt(_selectedIndex),
    );
  }
}
