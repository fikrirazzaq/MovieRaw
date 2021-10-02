import 'package:flutter/material.dart';

import 'components/now_playing_movie_section.dart';
import 'components/popular_movie_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NowPlayingMoviesSectionWidget(),
        PopularMoviesSectionWidget(),
      ],
    );
  }
}
