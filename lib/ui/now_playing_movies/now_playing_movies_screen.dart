import 'package:flutter/material.dart';

import 'now_playing_movies_body.dart';

class NowPlayingMoviesScreen extends StatelessWidget {
  const NowPlayingMoviesScreen({Key? key}) : super(key: key);
  static const String routeName = '/now_playing';

  @override
  Widget build(BuildContext context) {
    return NowPlayingMoviesBody();
  }
}
