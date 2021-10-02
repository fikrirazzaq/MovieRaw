import 'package:flutter/material.dart';
import 'package:movies_starter_app/values/assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(IMAGE_LOGO),
    );
  }
}
