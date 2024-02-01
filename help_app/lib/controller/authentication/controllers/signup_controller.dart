import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/view/profile/profile_page.dart';
import '../repository/authentication_repository.dart';
import '../repository/userRepo/user_repository.dart';
import '../../../model/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextEditingControllers to get data from TextFields
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
  }

  // Register Function
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  // LoginUser With PhonePass
  void loginUserPhone(String phone, String password) {
    AuthenticationRepository.instance.logIn(phone, password);
  }

  // Get user details from user
  Future<void> createUser(UserModel user) async {
    try {
      final existingUser = await userRepo.getUserDetails(user.email);

      if (existingUser != null) {
        Get.to(() => ProfilePage());
      } else {
        await userRepo.createUser(user);

        // Get.to(() => ProfilePage());
      }
    } catch (error) {
      print('Error creating user $error');
    }
  }

  // Get phone details from user
  Future<void> createPhoneUser(String user) async {
    // Get.to(() => const OTPScreen2());
    phoneLogin(user);
    //phoneLogin(user.phoneNumber);
    // await userRepo.createUser(user);
  }

  // Get phoneNo from user
  void phoneLogin(String phoneNo) {
    AuthenticationRepository.instance.phoneLogin(phoneNo);
  }

  // Get phoneNo from user
  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  @override
  void dispose() {
    // Dispose of any resources, such as TextEditingControllers
    fullname.dispose();
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
