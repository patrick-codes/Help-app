import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color_constants.dart';
import '../../registration/login_screen.dart';
import 'models/onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  double percentage = 0.25;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentList[currentIndex].backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white.withOpacity(0.5),
              child: Image.asset(
                contentList[currentIndex].image,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Container(
                  color: primaryColor.withOpacity(0.92),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                CupertinoButton(
                                  child: const Text(
                                    "Skip",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: tertiaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(() => const LoginScreen());
                                  },
                                ),
                              ],
                            ),
                            /*
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: CircularProgressIndicator(
                                          value: percentage,
                                          backgroundColor: Colors.white38,
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(
                                            secondaryColor,
                                          ),
                                        ),
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: primaryColor,
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Colors.white,
                                          //contentList[currentIndex].backgroundColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    if (currentIndex ==
                                        contentList.length - 1) {
                                      //Get.to(() => const WelcomeScreen());
                                    }
                                    _controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  },
                                ),
                             */
                          ],
                        ),

                        /*
                            child: 
                            
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  contentList[index].title,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28,
                                    letterSpacing: 0.24,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  contentList[index].description,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          */
                      ),
                      //Image.asset(contentList[index].image),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: contentList.length,
                      onPageChanged: (int index) {
                        if (index >= currentIndex) {
                          setState(() {
                            currentIndex = index;
                            percentage += 0.25;
                          });
                        } else {
                          setState(() {
                            currentIndex = index;
                            percentage -= 0.25;
                          });
                        }
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              contentList[index].title,
                              style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                letterSpacing: 0.24,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              contentList[index].description,
                              style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        );

                        /*child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(height: 5),
                            CupertinoButton(
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: secondaryColor,
                                ),
                              ),
                              onPressed: () {
                                //Get.to(() => const WelcomeScreen());
                              },
                            ),
                          ],
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 55,
                                width: 55,
                                child: CircularProgressIndicator(
                                  value: percentage,
                                  backgroundColor: Colors.white38,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    secondaryColor,
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: primaryColor,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  //contentList[currentIndex].backgroundColor,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            if (currentIndex == contentList.length - 1) {
                              //Get.to(() => const WelcomeScreen());
                            }
                            _controller!.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ],
                    ),
                 */
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex == contentList.length - 1) {
                        Get.to(() => const LoginScreen());
                      }
                      _controller!.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: tertiaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
