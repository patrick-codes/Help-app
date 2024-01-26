import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //late String? id;

  late String fullname;
  late final String email;
  late final String password;

  UserModel({
    //this.id,
    required this.fullname,
    required this.email,
    required this.password,
  });
  toJson2() {
    return {
      'Fullname': fullname,
      'Email': email,
      'Password': password,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'Fullname': fullname,
      "Email": email,
      "Password": password,
    };
  }

  // Named constructor to create a default UserModel
  UserModel.defaultModel() {
    // Set default values for the fields
    // id = 'defaultId';
    fullname = 'Default Fullname';
    email = 'default@example.com';
    password = 'Default Password';
  }

  //Map user fetched from firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return UserModel(
        // id: document.id,
        fullname: data['Fullname'],
        email: data["Email"],
        password: data['Password'],
      );
    } else {
      // Document not found, return a default UserModel or null
      print('Document not found for id: ${document.id}');
      return UserModel
          .defaultModel(); // Provide a default UserModel or return null
    }
  }
}
