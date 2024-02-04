import 'package:flutter/material.dart';

class CancelledSchedulePage extends StatefulWidget {
  const CancelledSchedulePage({super.key});

  @override
  State<CancelledSchedulePage> createState() => _CancelledSchedulePageState();
}

class _CancelledSchedulePageState extends State<CancelledSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "No cancelled schedules found!!",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
