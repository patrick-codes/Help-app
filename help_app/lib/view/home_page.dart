import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';

import '../model/news_model.dart';
import '../widgets/grid_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 13, left: 8, right: 8, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    NewsModel news = newsDetails[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          // for (int i = 1; i < 4; i++)
                          Container(
                            width: 300,
                            height: 220,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    news.imgUrl,
                                    height: 130,
                                    width: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        news.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                news.date,
                                                style: const TextStyle(
                                                  color: tertiaryColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 85,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: tertiaryColor),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "read more..",
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            news.time,
                                            style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //const SizedBox(height: 5),
                                      /*
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            color: Colors.yellow,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 0.5),
                                          Text(
                                            news.location,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                   */
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //const SizedBox(height: 10),
              GridItems(),
            ],
          ),
        ),
      ),
    );
  }
}
