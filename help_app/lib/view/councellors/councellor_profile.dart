import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/view/chat/chat_page.dart';

class CouncellorProfile extends StatefulWidget {
  CouncellorProfile({super.key});

  @override
  State<CouncellorProfile> createState() => _CouncellorProfileState();
}

class _CouncellorProfileState extends State<CouncellorProfile> {
  final List imgs = [
    "img1.png",
    "img2.png",
    "img3.png",
    "img4.png",
    "img1.png",
    "img2.png",
    "img3.png",
    "img4.png",
  ];

  String price = "300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: secondaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.more_vert,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/images/img4.png"),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Dr. Doctors name",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Therapist",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: secondaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.call),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ChatPage());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  CupertinoIcons.chat_bubble_text_fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 20,
                left: 12,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About Doctor",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const Text("4.9"),
                      const SizedBox(width: 5),
                      const Text(
                        "(124)",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text("see all"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        "assets/images/${imgs[index]}"),
                                  ),
                                  title: const Text(
                                    "Dr. Christiana Nkrumah",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: const Text("2 days ago"),
                                  trailing: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  overflow: TextOverflow.visible,
                                  maxLines: 4,
                                  "Hello ..I am Patrick, a passionate fdghj"
                                  "\ncross platform mobile applications",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ),
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: const Icon(
                        CupertinoIcons.location,
                      ),
                    ),
                    title: const Text("Weija-Gbawe Municipal Hospital"),
                    subtitle: const Text("Accra, Gbawe Top-Base 346 ST"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ),
                  //const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GHC 250",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // _displayBottomSheet(context, price);
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0),
                          bottom: Radius.circular(10),
                        ),
                      ),
                      actionsPadding: EdgeInsets.symmetric(),
                      actions: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const ListTile(
                              title: Text(
                                "From GHC 64/person",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text("Book for 2 quests, 10% off"),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      width: 260,
                                      height: 60,
                                      //padding: const EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color.fromARGB(
                                            255, 232, 231, 231),
                                        boxShadow: const [
                                          BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color: Colors.black12,
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "SELECT DATE AND TIME",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                Icon(Icons
                                                    .arrow_drop_down_sharp),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "2024-02-03",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.calendar,
                                      color: Colors.black54,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "02/02/2024",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.clock,
                                      color: Colors.black54,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "7:00 PM",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                thickness: 1,
                                height: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_pin,
                                      size: 20, color: Colors.red),
                                  Text(
                                    "Pickup Location",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  width: 308,
                                  height: 50,
                                  //padding: const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.done, color: Colors.white),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Complete Request",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 13),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  width: 308,
                                  height: 50,
                                  //padding: const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.cancel, color: Colors.white),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Cancel Request",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryColor,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext context, String stationname) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Container(
                color: primaryColor,
                child: Text("Hello"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
