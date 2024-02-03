import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'constants/color_constants.dart';
import 'controller/authentication/repository/authentication_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing Firebase...");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  print("Firebase initialized successfully.");

  Get.put(AuthenticationRepository());

  print("Initializing notifications...");
  //await controller.initNotification();
  print("Notifications initialized successfully.");

  //await Upgrader.clearSavedSettings();
  runApp(const MyApp());
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  //await Firebase.initializeApp();
  //await controller.initNotification();
  // Only call clearSavedSettings() during testing to reset internal values.
  //await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  runApp(const MyApp());
}
*/
/*Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        color: primaryColor,
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: primaryColor,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: primaryColor),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
          color: const Color.fromRGBO(245, 247, 248, 1),
          child: const Center(
            child: NutsActivityIndicator(
              activeColor: Colors.white,
              inactiveColor: secondaryColor,
              tickCount: 24,
              relativeWidth: 0.4,
              radius: 18,
              startRatio: 0.7,
              animationDuration: Duration(milliseconds: 500),
            ),
          ),
        ),
      ),
    );
  }
}
