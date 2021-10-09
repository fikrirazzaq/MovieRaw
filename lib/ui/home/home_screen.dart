import 'package:flutter/material.dart';
import 'package:movies_starter_app/ui/login/login_screen.dart';

import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeBody()),
    );
  }
}
