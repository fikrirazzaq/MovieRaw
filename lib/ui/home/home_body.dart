import 'package:flutter/material.dart';

import 'now_playing/now_playing_movie_section.dart';
import 'popular/popular_movie_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      physics: BouncingScrollPhysics(),
      children: [
        PopularMoviesSectionWidget(),
        SizedBox(height: 16),
        NowPlayingMoviesSectionWidget(),
      ],
    );
  }
}
