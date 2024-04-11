import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_app/model/user_model.dart';

class CouncellorModel {
  String? fullName;
  String? profession;
  String? address;
  String? contact;
  bool? isVerified;
  double? feeCharged;
  File? image;

  CouncellorModel({
    required this.fullName,
    required this.profession,
    required this.address,
    required this.contact,
    required this.isVerified,
    required this.feeCharged,
    required this.image,
  });

  toJson2() {
    return {
      'FullName': fullName,
      'Profession': profession,
      'Address': address,
      'Contact': contact,
      'Verified': isVerified,
      'Fee': feeCharged,
      'Image': image,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Profession': profession,
      'Address': address,
      'Contact': contact,
      'Verified': isVerified,
      'Fee': feeCharged,
      'Image': image,
    };
  }

  // Named constructor to create a default Counsellor Model
  CouncellorModel.defaultModel() {
    fullName = 'Default Fullname';
    profession = 'Default Profession';
    address = 'Default Address';
    contact = 'Default Contact';
    isVerified = false;
    feeCharged = 0.0;
    image = 'assets/images/default.png' as File?;
  }

  factory CouncellorModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return CouncellorModel(
        fullName: data['FullName'],
        profession: data['Profession'],
        address: data['Address'],
        contact: data['Contact'],
        isVerified: data['Verified'],
        feeCharged: data['FeeCharged'],
        image: data['Image'],
      );
    } else {
      print("Document not found");
      return CouncellorModel.defaultModel();
    }
  }
}
