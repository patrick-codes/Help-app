import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/view/home_main.dart';
import 'package:line_icons/line_icons.dart';
import 'package:text_divider/text_divider.dart';

import '../../constants/color_constants.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

bool isVisible = true;

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Image(
                    height: 40,
                    width: 150,
                    image: AssetImage("assets/icons/logo.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Signup",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 13),
                        hintText: 'full name',
                        prefixIcon: const Icon(Icons.person_3_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        filled: true,
                        fillColor: secondaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 13),
                        hintText: 'email address',
                        prefixIcon: const Icon(Icons.email_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        filled: true,
                        fillColor: secondaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: isVisible ? false : true,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 13),
                        hintText: 'password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = false;
                            });
                          },
                          child: !isVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        filled: true,
                        fillColor: secondaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const HomePage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Signup",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already registered? ",
                            style: TextStyle(
                              color: secondaryColor,
                            ),
                          ),
                          Text(
                            "Login now",
                            style: TextStyle(
                              color: tertiaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextDivider.horizontal(
                      text: const Text(
                        'or',
                        style: TextStyle(
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: secondaryColor,
                          ),
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 20,
                              width: 20,
                              color: secondaryColor,
                              image: AssetImage("assets/icons/google_50px.png"),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Signup with Google",
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: secondaryColor,
                          ),
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 20,
                              width: 20,
                              color: secondaryColor,
                              image:
                                  AssetImage("assets/icons/facebook_50px.png"),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Signup with Facebook",
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
