import 'package:flutter/material.dart';

class CompletedSchedulePage extends StatefulWidget {
  const CompletedSchedulePage({super.key});

  @override
  State<CompletedSchedulePage> createState() => _CompletedSchedulePageState();
}

class _CompletedSchedulePageState extends State<CompletedSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "No completed schedules found!!",
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
