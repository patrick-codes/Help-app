import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/controller/authentication/controllers/profile_controller.dart';

class UpdateProfileController extends GetxController {
  static UpdateProfileController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final city = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  final profileRepo = Get.put(ProfileRepository());

//Get user details from user
  /*Future<void> createUserProfile(ProfileModel userProfile) async {
    await profileRepo.createProfile(userProfile);
  }
  */
}
