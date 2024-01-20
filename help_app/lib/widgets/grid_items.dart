import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/model/news_model.dart';
import 'package:help_app/view/alerts_page.dart';
import 'package:help_app/view/card%20details/card_details.dart';
import 'package:help_app/view/chat_page.dart';
import 'package:help_app/view/favorite_page.dart';
import '../view/registration/login_screen.dart';

class GridItems extends StatelessWidget {
  GridItems({super.key});

  final List pages = [
    const FavoritePage(),
    const ChatPage(),
    const FavoritePage(),
    const ChatPage(),
  ];
  final List cardNames = [
    "card1",
    "card2",
    "card3",
    "card4",
  ];

  final List icons = [
    "icon1",
    "icon2",
    "icon4",
    "icon5",
  ];

  final List title = [
    "Quick Talk & Support",
    "Create Panic alert",
    "Report Abuse",
    "UNICEF",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: newsDetails.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        NewsModel news = newsDetails[index];

        return GestureDetector(
          onTap: () {
            Get.to(() => const ChatPage());
            /* 
           Get.to(() => CardDetails(
                  newsDetails: news,
                  address: '',
                ));
          */
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 80,
                        width: 80,
                        "assets/icons/${icons[index]}.png",
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${title[index]}",
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
