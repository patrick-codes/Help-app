import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //late String? id;
  late String email;

  late String fullname;
  late String city;
  late String phoneNumber;
  late String address;
  //String image;
  //final String username;
  //final String phoneNumber;
  //final String email;
  //final String password;

  UserModel({
    //this.id,
    required this.email,
    required this.fullname,
    required this.city,
    required this.phoneNumber,
    required this.address,
    //required this.image,
    //required this.username,
    //required this.phoneNumber,
    // required this.email,
    //required this.password,
  });
  toJson2() {
    return {
      'Email': email,

      'Fullname': fullname,
      'City': city,
      'PhoneNumber': phoneNumber,
      'Address': address,
      // 'Image': image,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'Email': email,

      'Fullname': fullname,
      'City': city,
      'PhoneNumber': phoneNumber,
      'Address': address,
      //'Image': image,
      //"Username": username,
      //"Phone Number": phoneNumber,
      //"Email": email,
      //"Password": password,
    };
  }

  // Named constructor to create a default UserModel
  UserModel.defaultModel() {
    // Set default values for the fields
    // id = 'defaultId';
    email = 'default@example.com';

    fullname = 'Default Fullname';
    city = 'Default City';
    phoneNumber = 'Default Phone Number';
    address = 'Default Address';
  }

  //Map user fetched from firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return UserModel(
        // id: document.id,
        email: data["Email"],
        fullname: data['Fullname'],
        city: data['City'],
        phoneNumber: data["PhoneNumber"],
        address: data['Address'],
      );
    } else {
      // Document not found, return a default UserModel or null
      print('Document not found for id: ${document.id}');
      return UserModel
          .defaultModel(); // Provide a default UserModel or return null
    }
  }
}
