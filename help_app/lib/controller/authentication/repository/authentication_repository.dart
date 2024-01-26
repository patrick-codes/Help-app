import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:help_app/view/home_main.dart';
import 'package:help_app/view/intro%20screen/onbaording/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/color_constants.dart';
import '../../../view/intro screen/splash_screen.dart';
import '../../../view/registration/login_screen.dart';
import '../../../widgets/indicator.dart';
import 'authenticationRepo/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  User? get _firebaseUser => firebaseUser.value;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    //FlutterNativeSplash.remove();
    //setInitialScreen(firebaseUser.value);
    ever(firebaseUser, setInitialScreen);
  }

  Future<void> setInitialScreen(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasShownScreens = prefs.getBool('hasShownScreens') ?? false;

    if (!hasShownScreens) {
      Get.offAll(() => SplashScreen());
      prefs.setBool('hasShownScreens', true);
    } else {
      if (user == null) {
        Get.offAll(() => HomePage(
              address: '',
            ));
      } else {
        if (user.emailVerified) {
          Get.offAll(() => HomePage(
                address: '',
              ));
        } else {
          Get.offAll(() => const OnBoardingScreen());
        }
      }
    }
  }

  /*setInitialScreen(User? user) async {
    /*  user == null
        ? Get.offAll(() => SplashScreen())
        : Get.offAll(() => HomeScreenNew());
*/
    user == null
        ? Get.offAll(() => SplashScreen())
        : user.emailVerified
            ? Get.offAll(() => HomeScreenNew(
                  email: user.displayName!,
                ))
            : Get.offAll(() => const WelcomeScreen());
  }*/

  //PhonePass Login
  Future<void> logIn(String phoneNumber, String password) async {
    final fireStoreInst = FirebaseFirestore.instance;

    /*await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+233$phoneNo',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
    */
    try {
      DocumentSnapshot userSnapShot =
          await fireStoreInst.collection('Users').doc(phoneNumber).get();
      Map<String, dynamic>? userData =
          userSnapShot.data() as Map<String, dynamic>?;

      if (userData != null && userData['Password'] == password) {
        Get.snackbar('Success', 'Login Successful');
        print("Login Successful!!");
        //6k$b6k$Bb
        //Get.to(() => HomeScreenNew());
      } else {
        Get.snackbar('Login Failed', 'Incorrect Password!!"');
        print("Incorrect Password!!");
      }
    } catch (e) {
      print("Login Failed:$e");
    }
  }

////////////////
  Future<void> phoneLogin(String phoneNo) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+233$phoneNo',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

//Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      Get.snackbar('EMAIL SENT', 'Check your email for the verification link');
    } on FirebaseAuthException catch (e) {
      final ex = Exception(e.code);
      Get.snackbar('ERROR', e.code);
      throw ex;
    } catch (_) {
      const excep = FirebaseAuthException;
      throw excep;
    }
  }

  //GoogleAuth
  Future<UserCredential> signInWithGoogle() async {
    try {
      Indicator.showLoading();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      Indicator.showLoading();

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = Exception(e.code);
      throw ex;
    } catch (_) {
      const excep = FirebaseAuthException;
      throw excep;
    }
  }

  /*
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      //if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      /*UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {}
        }
        */
      //}
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = Exception(e.code);
      throw ex;
    } catch (_) {
      const excep = FirebaseAuthException;
      throw excep;
    }
  }
*/
//Phone Number Authentication
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+233$phoneNo',
      timeout: const Duration(seconds: 120),
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, forceResendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-Phone-umber') {
          Get.snackbar('Error', 'The phone number provided is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again!');
        }
      },
    );
  }

  //OTP
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  //SingCr
  Future<UserCredential> credVerifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials;
  }

//SignupAuth
  Future<void> createUserWithEmailAndPassword(
      String sEmail, String sPassword) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: sEmail, password: sPassword);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification();
      } else if (_auth.currentUser!.emailVerified) {
        firebaseUser.value != null
            ? Get.offAll(() => HomePage(
                  address: '',
                ))
            //replace route with signupscreen later
            : Get.offAll(() => const OnBoardingScreen());
      }
    } on FirebaseAuthException catch (e) {
      final excep = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${excep.message}');
      Get.snackbar(
        'ERROR!!',
        excep.message,
        duration: const Duration(seconds: 4),
        //colorText: Colors.white,
        backgroundColor: secondaryColor,
        overlayBlur: 3,
      );

      //Wprint('FIREBASE AUTH EXCEPTION - ${excep.message}');
      //throw excep;
    } catch (_) {
      const excep = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${excep.message}');
      Get.snackbar(
        'ERROR!!',
        excep.message,
        duration: const Duration(seconds: 4),
        //colorText: Colors.white,
        backgroundColor: secondaryColor,
        overlayBlur: 3,
      );
      throw excep;
    }
  }

//LoginAuth Email & Password
  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification();
        Get.to(() => const LoginScreen());
      } else if (_auth.currentUser!.emailVerified) {
        firebaseUser.value != null
            ? Get.offAll(() => HomePage(
                  address: '',
                ))
            //replace route with signupscreen later

            : Get.offAll(() => const OnBoardingScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'ERROR!!', 'Check your mail to verify your account' '${e.code}',

        duration: const Duration(seconds: 4),
        //colorText: Colors.white,
        backgroundColor: secondaryColor,
        overlayBlur: 3,
      );
      Get.to(() => const LoginScreen());
      /*final excep = SignUpWithEmailAndPasswordFailure.code(e.code);
      SnackBar(
        content: Text(excep.message),
      );*/
    } catch (_) {}
  }

//LoginAuth with phone and password
  Future<void> loginUserWithPhoneAndPassword(String number) async {
    try {
      await _auth.verifyPhoneNumber(
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-Phone-umber') {
            Get.snackbar('Error', 'The phone number provided is not valid');
          } else {
            Get.snackbar('Error', 'Something went wrong. Try again!');
          }
        },
        codeSent: (verificationId, forceResendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );

      /*final excep = SignUpWithEmailAndPasswordFailure.code(e.code);
      SnackBar(
        content: Text(excep.message),
      );*/
    } catch (_) {}
  }

  //LogOut
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Unable to Logout. Try again';
    }
  }
}
