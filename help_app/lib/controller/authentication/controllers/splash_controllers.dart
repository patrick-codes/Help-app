import 'package:get/get.dart';
import 'package:help_app/view/intro%20screen/onbaording/onboarding_screen.dart';

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future splashState() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Get.to(() => const OnBoardingScreen());
    /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ));*/
  }
}

/*
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future splashState() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    // Use Get.off to replace the current screen
    Get.off(() => const NewOnBoardingScreen());

    // Set the hasShownScreens flag in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasShownScreens', true);
  }
}

*/
