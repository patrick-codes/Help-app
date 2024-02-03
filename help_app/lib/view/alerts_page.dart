import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

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
                "Complete Request",
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
      //backgroundColor: Co,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Schedule your request",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        "From GHC 64/person",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Book for 2 quests, 10% off"),
                      /*trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/img2.png"),
                      ),
                    */
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              width: 308,
                              height: 60,
                              //padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 232, 231, 231),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "SELECT DATE AND TIME",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down_sharp),
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
                    /*   const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                 */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
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
                        const Row(
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Confirmed",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
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
                          Icon(Icons.location_pin, size: 20, color: Colors.red),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                    const SizedBox(height: 15),
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
