import 'package:get/get.dart';

import '../repository/authentication_repository.dart';
import '../repository/userRepo/user_repository.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /*getUserData() {
    final phoneN = _authRepo.firebaseUser.value?.phoneNumber;
    if (phoneN != null) {
      return _userRepo.getUserDetails(phoneN);
    } else {
      Get.snackbar("ERROR", "Login to continue");
    }
  }
*/
}
