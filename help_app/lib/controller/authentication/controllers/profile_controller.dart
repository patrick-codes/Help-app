import 'package:get/get.dart';
import '../../../model/user_model.dart';
import '../repository/authentication_repository.dart';
import '../repository/userRepo/user_repository.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  Future<UserModel?> getUserDetails() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      try {
        // Invoke _userRepo.getUserDetails and return the result
        return await _userRepo.getUserDetails(email);
      } catch (error) {
        // Handle any potential errors during the fetching process
        print('Error fetching user details: $error');
        throw Exception(error);
        //throw error; // Rethrow the error to be caught by the FutureBuilder
      }
    } else {
      Get.snackbar('Error', 'Login to continue!!');
      // If user is not logged in, you might want to throw an error or return a default user model
      throw 'User not logged in';
    }
  }

  updateUserDetails(UserModel user) async {
    await _userRepo.updateUserDetails(user);
  }
/*
  getUserDetails() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails;
    } else {
      Get.snackbar('Error', 'Login to continue!!');
    }
  }
*/
  // final _profileDb = FirebaseFirestore.instance;
/*
  createProfile(ProfileModel userProfile) async {
    await _profileDb
        .collection('profile')
        .add(userProfile.toJson())
        .whenComplete(() => Get.snackbar(
              'Sucess',
              'Profile Updates!!',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            ))
        .catchError((error, StackTrace) {
      Get.snackbar(
        'Error',
        'Something went wrong. Try again!!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print(error.toString());
    });
  }
*/
}
