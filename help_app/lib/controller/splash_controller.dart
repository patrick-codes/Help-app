/*
import 'package:get/get.dart';
import '../../../view/intro/onboarding/onboarding_new.dart';
import '../../../view/intro/onboarding/onboarding_screen.dart';

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future splashState() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Get.to(() => const NewOnBoardingScreen());
    /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ));*/
  }
}
*/

import 'package:get/get.dart';
import 'package:help_app/view/home.dart';
import 'package:help_app/view/intro%20screen/onbaording/onboarding_screen.dart';

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future splashState() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    // Use Get.off to replace the current screen
    Get.off(() => const OnBoardingScreen());

    // Set the hasShownScreens flag in SharedPreferences
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setBool('hasShownScreens', true);
  }
}
