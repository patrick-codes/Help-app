import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/constants/color_constants.dart';
import '../../controller/authentication/controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.splashState();
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    height: 50,
                    width: 180,
                    image: AssetImage("assets/icons/logo.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
