import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:line_icons/line_icons.dart';
import '../model/news_model.dart';

class CustomAppBar extends StatelessWidget {
  final String address;
  const CustomAppBar({
    super.key,
    required this.address,
  });
  //final Size size;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      scrolledUnderElevation: 1,
      elevation: 1,
      centerTitle: true,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(
        color: secondaryColor,
      ),
      backgroundColor: primaryColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                height: 35,
                width: 120,
                image: AssetImage("assets/icons/logo.png"),
              ),
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: Scaffold.of(context).openDrawer,
                    child: const Badge(
                      label: Text("2"),
                      child: Icon(
                        Icons.menu,
                        color: secondaryColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            width: (size.width - (20 + 60)),
            child: Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 18,
                  color: tertiaryColor,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  address,
                  //"Weija Gbawe Accra, Djaman Street 234",
                  style: TextStyle(
                    fontSize: 12,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      /* SizedBox(
            width: (size.width - (20 + 60)),
            child: const Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 18,
                  color: tertiaryColor,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "Weija Gbawe Accra, Djaman Street 234",
                  style: TextStyle(
                    fontSize: 12,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        */
    );
  }
}
