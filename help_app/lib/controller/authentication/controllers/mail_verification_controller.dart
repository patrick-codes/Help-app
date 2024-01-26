import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../repository/authentication_repository.dart';

class MailVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
  }

//Send mail verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = Exception(e.code);
      throw ex;
    } catch (_) {
      const excep = FirebaseAuthException;
      //throw excep;
    }
  }
}
