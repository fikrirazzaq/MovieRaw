import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'routes/routes.dart';
import 'ui/splashscreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movies',
      theme: ThemeData.light(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: SplashScreen.routeName,
      builder: EasyLoading.init(),
    );
  }
}
