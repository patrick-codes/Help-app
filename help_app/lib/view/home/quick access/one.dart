import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';

class TalkSupportPage extends StatefulWidget {
  const TalkSupportPage({super.key});

  @override
  State<TalkSupportPage> createState() => _TalkSupportPageState();
}

class _TalkSupportPageState extends State<TalkSupportPage> {
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
                "Talk & Support",
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
    );
  }
}
