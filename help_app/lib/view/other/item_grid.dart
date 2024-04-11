import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/constants/color_constants.dart';

import '../map/map_page.dart';

class ItemGridPage extends StatefulWidget {
  const ItemGridPage({super.key});

  @override
  State<ItemGridPage> createState() => _ItemGridPageState();
}

class _ItemGridPageState extends State<ItemGridPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.67,
      children: [
        for (int i = 1; i < 9; i++)
          Container(
            //padding: const EdgeInsets.symmetric(),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black12,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const MapPage());
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'online',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.circle,
                          size: 8.5,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    /*Image.asset(
                      "assets/icons/icon5.png",
                      height: 115,
                      width: 115,
                      fit: BoxFit.cover,
                    ),
                    */
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/img3.png"),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "Dr. Osei Boafo",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.work_outline_outlined,
                                color: Colors.black,
                                size: 13,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                "Medical Doctor",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    //const SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "(+233) 0245513607",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Accra Dansoman",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
