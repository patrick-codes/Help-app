import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/widgets/schedule%20widgets/cancelled_widget.dart';
import 'package:help_app/widgets/schedule%20widgets/upcoming_widget.dart';

import '../../widgets/schedule widgets/completed_widget.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _buttonIndex = 0;

  final List _scheduleWidgets = [
    const UpcomingWidget(),
    const CompletedSchedulePage(),
    const CancelledSchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
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
                  "Schedule",
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: secondaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        color:
                            _buttonIndex == 0 ? primaryColor : secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Upcoming",
                            style: TextStyle(
                              fontSize: 12,
                              color: _buttonIndex == 0
                                  ? Colors.white
                                  : primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            _buttonIndex == 1 ? primaryColor : secondaryColor,
                      ),
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              _buttonIndex == 1 ? Colors.white : primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        color:
                            _buttonIndex == 2 ? primaryColor : secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Cancelled",
                        style: TextStyle(
                          color:
                              _buttonIndex == 2 ? Colors.white : primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _scheduleWidgets[_buttonIndex],
          ],
        ),
      ),
    );
  }
}
