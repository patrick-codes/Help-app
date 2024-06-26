import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:help_app/view/chat/chat_page.dart';

import '../../model/councellor/councellor_model_testing.dart';
import '../book appointment/checkout.dart';
import '../book appointment/succes_checkout.dart';

class CouncellorProfile extends StatefulWidget {
  String? name;
  String? profession;
  String? location;
  double? fee;
  bool? isVerified;
  String? about;
  int? review;

  CouncellorProfile(
      {required this.name,
      required this.profession,
      required this.location,
      required this.fee,
      required this.isVerified,
      required this.about,
      required this.review,
      super.key});

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
  int randomOne = 0;
  int randomTwo = 0;
  int randomThree = 0;
  int randomFour = 0;
  String? transactionId = '0000';

  List<Icon> icon = [
    const Icon(Icons.star, color: Colors.amber, size: 16),
    const Icon(Icons.star, color: Colors.amber, size: 16),
  ];

  List<Icon> starsFunction() {
    for (int i = 0; i <= widget.review!;) {
      return icon;
    }
    return icon;
  }

//Transaction id generator
  void randomCode(randomOne, randomTwo, randomThree, randomFour) {
    try {
      Random rand = Random();
      Random rand2 = Random();
      Random rand3 = Random();
      Random rand4 = Random();

      setState(() {
        randomOne = rand.nextInt(10);
        randomTwo = rand.nextInt(10);
        randomThree = rand.nextInt(10);
        randomFour = rand.nextInt(10);

        for (int i = 0; i <= randomOne; i++) {
          transactionId = 'TRS$randomOne$randomTwo$randomThree$randomFour';
          print('Transaction ID: ${transactionId}');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    randomCode(randomOne, randomTwo, randomThree, randomFour);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: secondaryColor,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/img4.png"),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Dr. ${widget.name}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${widget.profession}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                Get.to(() => ChatPage());
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
            const SizedBox(height: 2),
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
                  Row(
                    children: [
                      Text(
                        "About Doctor ${widget.name}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.verified,
                        color: widget.isVerified! ? Colors.green : Colors.grey,
                        size: 17,
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  Text(
                    "${widget.about}",
                    style: const TextStyle(
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
                      for (int i = 1; i <= widget.review!; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                      const SizedBox(width: 5),
                      Text(
                        "(${widget.review}.5)",
                        style: const TextStyle(fontWeight: FontWeight.w500),
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
                      itemCount: councellorDetails.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        TestingCouncellorModel councellor =
                            councellorDetails[index];
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
                                  title: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "Dr. ${councellor.fullName}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "${councellor.profession}",
                                  ),
                                  trailing: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      Text(
                                        "${councellor.review}.5",
                                        style: const TextStyle(
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
                                  overflow: TextOverflow.ellipsis,
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

                  const SizedBox(width: 5),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(),
                    dense: false,
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
                    title: Text("${widget.location}"),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GHC ${widget.fee}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 5, 157, 10),
                      fontSize: 18,
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
                  barrierDismissible: false,
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
                      actionsPadding: const EdgeInsets.symmetric(),
                      actions: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const Icon(
                              Icons.check_circle,
                              size: 75,
                              color: Colors.green,
                            ),
                            const Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                "Confirm Appointment",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "You are booking an appointment with",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "Dr. ${widget.name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(),
                                            child: Text("Profession:"),
                                          ),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Text("${widget.profession}"),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(),
                                            child: Text("Date:"),
                                          ),
                                          SizedBox(width: 44),
                                          Text(" 24/02/24")
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(),
                                            child: Text("Time:"),
                                          ),
                                          SizedBox(width: 44),
                                          Text("3:45 PM")
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(),
                                            child: Text("Location:"),
                                          ),
                                          const SizedBox(width: 23),
                                          Text("${widget.location}"),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(),
                                            child: Text(
                                              "Fee:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 57),
                                          Text(
                                            "GHC ${widget.fee}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SuccesPage(
                                      transactionId: transactionId,
                                    ));
                                Get.snackbar(
                                  snackStyle: SnackStyle.FLOATING,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(bottom: 10, top: 10),
                                  snackPosition: SnackPosition.BOTTOM,
                                  borderRadius: 10,
                                  backgroundColor: Colors.green,
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  duration: Duration(seconds: 5),
                                  colorText: Colors.white,
                                  'Appointment Booked!!',
                                  'You have booked an appointment with ${widget.name}',
                                );
                              },
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
                                      Text(
                                        "Book Appointment",
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
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.snackbar(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(bottom: 10, top: 10),
                                  borderRadius: 10,
                                  backgroundColor: Colors.red,
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  duration: Duration(seconds: 5),
                                  colorText: Colors.white,
                                  'Cancelled Appointment !!',
                                  'You cancelled your appointment with ${widget.name}',
                                );
                              },
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
                                      Text(
                                        "Cancel Appointment",
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
                            const SizedBox(height: 30),
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
                child: const Text("Hello"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
