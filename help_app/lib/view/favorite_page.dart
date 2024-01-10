import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: tertiaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Favorites bPage',
            ),
          ],
        ),
      ),
    );
  }
}
