import 'package:flutter/material.dart';
import 'package:movies_starter_app/ui/dashboard/dashboard_screen.dart';
import 'package:movies_starter_app/ui/login/login_screen.dart';
import 'package:movies_starter_app/ui/movie_detail/movie_detail_screen.dart';
import 'package:movies_starter_app/ui/now_playing_movies/now_playing_movies_screen.dart';
import 'package:movies_starter_app/ui/popular_movies/popular_movies_screen.dart';
import 'package:movies_starter_app/ui/splashscreen/splash_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      case PopularMoviesScreen.routeName:
        return MaterialPageRoute(builder: (_) => PopularMoviesScreen());

      case NowPlayingMoviesScreen.routeName:
        return MaterialPageRoute(builder: (_) => NowPlayingMoviesScreen());


      case MovieDetailScreen.routeName:
        var movieArgs = settings.arguments as MovieDetailArguments;
        return MaterialPageRoute(
          builder: (_) => MovieDetailScreen(args: movieArgs),
        );
    }
  }
}
