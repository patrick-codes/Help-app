import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/model/councellor/councellor_model_testing.dart';

class CouncellorPageController extends GetxController {
  static CouncellorPageController get instance => Get.find();

  final TextEditingController _searchController = TextEditingController();
}
