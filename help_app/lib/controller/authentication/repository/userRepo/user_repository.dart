import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      // await _db.collection("Users").add(user.toJson());
      await _db.collection("Users").add(user.toJson());
      print('User created successfully');
      Get.snackbar(
        "Success",
        "Profile Created!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error creating user: $error');
    }
  }

  Future<UserModel?> getUserDetails(String email) async {
    try {
      final snapshot =
          await _db.collection("Users").where("Email", isEqualTo: email).get();

      if (snapshot.docs.isNotEmpty) {
        // If there are multiple documents with the same email, return the first one
        return UserModel.fromSnapshot(snapshot.docs.first);
      } else {
        // If no documents are found, return null or handle it accordingly
        return null;
      }
    } catch (error) {
      print('Error fetching user details: $error');
      throw error;
    }
  }

  // Fetch User details
  Future<UserModel> getUserDetails2(String email) async {
    try {
      final snapshot =
          await _db.collection("Users").where("Email", isEqualTo: email).get();
      final userData =
          snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userData;
    } catch (error) {
      print('Error fetching user details: $error');
      rethrow; // Rethrow the error for handling in the calling code
    }
  }

//Updated
/*
  Future<void> updateUserDetails3(UserModel user) async {
    try {
      // Ensure user.id is not null before attempting to update
      if (user.id != null) {
        await _db.collection("Users").doc(user.id).update(user.toJson());
        print('User details updated successfully');
        Get.snackbar('Updated', 'Profile Updated!!');
      } else {
        // Handle the case where user.id is null
        throw 'User ID is null';
      }
    } catch (error) {
      print('Error updating user details: $error');
      rethrow;
    }
  }
*/
  Future<void> updateUserDetails(UserModel user) async {
    try {
      print('User ID before update: ${user.email}');
      //print('User details before update: ${user.toMap()}');

      // Ensure user.id is not null before attempting to update
      if (user.email != null) {
        await _db.collection("Users").doc(user.email).update(user.toJson());
        print('User details updated successfully');
        Get.snackbar('Updated', 'Profile Updated!!');
      } else {
        // Handle the case where user.id is null
        throw 'User ID is null';
      }
    } catch (error) {
      print('Error updating user details: $error');
      rethrow;
    }
  }

  // Fetch all users
  Future<List<UserModel>> getAllDetails() async {
    try {
      final snapshot = await _db.collection("Users").get();
      final userData =
          snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      return userData;
    } catch (error) {
      print('Error fetching all user details: $error');
      rethrow;
    }
  }
}


/*
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              "SUCESS",
              "Profile Updated!!",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            ))
        .catchError((error, stackTrace) {
      Get.snackbar(
        "ERROR",
        "Something Went Wrong!!. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }

  _showAlertBanner(String message) {
    Flushbar(
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.cancel_rounded,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: const Duration(seconds: 5),
    );
  }

//Fetch User details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }

  //Update User details
  Future<void> updateUserDetails(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  //Fetch all users
  Future<List<UserModel>> getAllDetails() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();

    return userData;
  }
}
*/