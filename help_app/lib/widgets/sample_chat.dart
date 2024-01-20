import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: secondaryColor),
              child: const Text(
                  "Hello, Welcome to HappyHelp..How can I help you?"),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 80),
            child: ClipPath(
              clipper: LowerNipMessageClipper(
                MessageType.send,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, bottom: 25, right: 20),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: const Text(
                  "Hi, HappyHelp.. are you there?",
                  style: TextStyle(
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
