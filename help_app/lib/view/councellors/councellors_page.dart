import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/model/councellor/councellor_model_testing.dart';
import '../../constants/color_constants.dart';
import '../alerts_page.dart';
import '../home/home_page.dart';
import '../map/map_page.dart';
import '../profile/profile_page.dart';
import 'scheduled_page.dart';
import 'councellor_profile.dart';

class CouncellorsPage extends StatefulWidget {
  CouncellorsPage({super.key});

  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    SchedulePage(),
    const AlertPage(),
    const MapPage(),
    const ProfilePage(),
  ];

  @override
  State<CouncellorsPage> createState() => _CouncellorsPageState();
}

class _CouncellorsPageState extends State<CouncellorsPage> {
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
                "Councellors",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: primaryColor,
                              size: 20,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(
                height: 15,
                thickness: 0.5,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 30,
                width: 250,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Text(
                        "All Councellors & Pyschologist",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "(${councellorDetails.length})",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: councellorDetails.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                TestingCouncellorModel? councellor = councellorDetails[index];
                return ListTile(
                  onTap: () {
                    Get.to(() => CouncellorProfile(
                          name: councellor.fullName,
                          profession: councellor.profession,
                          location: councellor.address,
                          fee: councellor.feeCharged,
                          isVerified: councellor.isVerified,
                          about: councellor.about,
                          review: councellor!.review,
                        ));
                  },
                  minVerticalPadding: 15,
                  leading: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Stack(
                      textDirection: TextDirection.rtl,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 55,
                            height: 55,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/images/${imgs[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 2, top: 40),
                          padding: const EdgeInsets.all(3),
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.verified,
                            color: councellor!.isVerified!
                                ? Colors.green
                                : Colors.grey,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    "Dr. ${councellor!.fullName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        councellor!.profession!,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    "GHC ${councellor!.feeCharged}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      /*  bottomSheet: GestureDetector(
        onTap: () {
          Get.to(() => const MapPage());
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: 330,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black12,
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                size: 24,
                color: tertiaryColor,
              ),
              SizedBox(width: 7),
              Text(
                "CREATE PANIC CALL NOW",
                style: TextStyle(
                  fontSize: 15,
                  color: tertiaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    */
    );
  }
}
