import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_starter_app/bloc/bloc/movie_bloc.dart';
import 'package:movies_starter_app/bloc/cubit/bottom_nav_cubit.dart';

import 'routes/routes.dart';
import 'ui/splashscreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'My Movies',
        theme: ThemeData.light(),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: SplashScreen.routeName,
        builder: EasyLoading.init(),
      ),
    );
  }
}
