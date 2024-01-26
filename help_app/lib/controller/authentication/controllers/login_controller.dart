import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import '../../../constants/color_constants.dart';
import '../repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

//TextEditingControllers to get data from TextFields
  final username = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isGoogleLoading = false;

  //GoogleSignIn
  Future<void> googleSignIn() async {
    try {
      //  isGoogleLoading = true;
      const NutsActivityIndicator(
        activeColor: Colors.white,
        inactiveColor: secondaryColor,
        tickCount: 24,
        relativeWidth: 0.4,
        radius: 15,
        startRatio: 0.7,
        animationDuration: Duration(milliseconds: 500),
      );
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      auth.setInitialScreen(auth.firebaseUser as User?);
      // isGoogleLoading.value = false;
      const NutsActivityIndicator(
        activeColor: Colors.white,
        inactiveColor: secondaryColor,
        tickCount: 24,
        relativeWidth: 0.4,
        radius: 15,
        startRatio: 0.7,
        animationDuration: Duration(milliseconds: 500),
      );
    } catch (e) {}
  }

//Register Function
  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }

  void loginUserPhone(String number) {
    AuthenticationRepository.instance.loginUserWithPhoneAndPassword(number);
  }
}
