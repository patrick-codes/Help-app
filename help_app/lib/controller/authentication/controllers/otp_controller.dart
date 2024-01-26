import 'package:get/get.dart';
import 'package:help_app/view/home_main.dart';
import '../repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

//Register Function
  Future<void> verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified
        ? Get.offAll(() => HomePage(
              address: '',
            ))
        : Get.back();
  }

  //Login Function
  Future<void> LoginverifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified
        ? Get.offAll(() => HomePage(
              address: '',
            ))
        : Get.back();
  }
}
