import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/sample_chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: secondaryColor,
          ),
          backgroundColor: primaryColor,
          leadingWidth: 20,
          title: const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "assets/images/img2.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Dr. John Smith",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 8.0, right: 20),
              child: Icon(
                CupertinoIcons.phone,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, right: 15),
              child: Icon(
                CupertinoIcons.video_camera,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, right: 10),
              child: Icon(
                Icons.more_vert,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding:
            const EdgeInsets.only(top: 18, left: 13, right: 13, bottom: 80),
        itemBuilder: (context, index) {
          return const ChatSample();
        },
      ),
      bottomSheet: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.add_outlined,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.emoji_emotions_outlined,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width / 1.6,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Type something",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.send,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
