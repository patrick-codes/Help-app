import 'package:flutter/material.dart';
import 'package:help_app/widgets/customapp_bar.dart';

import '../../constants/color_constants.dart';
import '../../model/news_model.dart';

class CardDetails extends StatefulWidget {
  const CardDetails(
      {super.key, required this.newsDetails, required this.address});
  final String address;
  final NewsModel newsDetails;

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: secondaryColor,
        ),
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.newsDetails.title,
              style: const TextStyle(
                color: secondaryColor,
                fontSize: 15,
              ),
            ),
            const Icon(
              Icons.settings,
              color: secondaryColor,
            ),
          ],
        ),
      ),
      //backgroundColor: tertiaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.newsDetails.title,
            ),
          ],
        ),
      ),
    );
  }
}
