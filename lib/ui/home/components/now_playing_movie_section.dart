import 'package:flutter/material.dart';
import 'package:movies_starter_app/ui/_reusable/movie_horizontal_listview_widget.dart';

class NowPlayingMoviesSectionWidget extends StatelessWidget {
  const NowPlayingMoviesSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Now Playing'),
        // MovieHorizontalListViewWidget(),
      ],
    );
  }
}
