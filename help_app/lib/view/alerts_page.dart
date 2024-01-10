import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: tertiaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Alerts Page',
            ),
          ],
        ),
      ),
    );
  }
}
