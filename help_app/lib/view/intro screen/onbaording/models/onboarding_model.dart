import 'package:flutter/material.dart';
import 'package:help_app/constants/color_constants.dart';

class OnboardingContent {
  String image;
  String title;
  String description;
  Color backgroundColor;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

List<OnboardingContent> contentList = [
  OnboardingContent(
    image: 'assets/images/img1.png',
    title: 'Who we are',
    description:
        'This platform was built to make a difference in the lives of gender-based violence (GBV) survivors. Our team has a wealth of experience working with survivors, communities, and the criminal justice system.',
    backgroundColor: tertiaryColor,
  ),
  OnboardingContent(
    image: 'assets/images/img2.png',
    title: 'Our mission',
    description:
        'We work hard to enable access to justice for those experiencing violence through innovative technology, data-informed reporting, and capacity-building. Our vision is to build a world where everyone feels safe.',
    backgroundColor: tertiaryColor,
  ),
  OnboardingContent(
    image: 'assets/images/img3.png',
    title: 'Transparency',
    description:
        'We are always aiming to be as transparent as possible with you, so we have linked our yearly Annual Reports below for you to download and read. It documents what we’ve been working towards, when we’ve been awarded more funding, and where your donations go.',
    backgroundColor: tertiaryColor,
  ),
];
