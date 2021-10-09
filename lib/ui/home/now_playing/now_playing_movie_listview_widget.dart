import 'package:flutter/material.dart';
import 'package:movies_starter_app/ui/_model/movie_item.dart';

import '../../movie_detail/movie_detail_screen.dart';
import 'now_playing_movie_listitem_widget.dart';

class NowPlayingMovieListViewWidget extends StatelessWidget {
  final List<MovieItem> movieItems;
  const NowPlayingMovieListViewWidget({Key? key, required this.movieItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 6),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: 6,
        itemBuilder: (context, index) {
          return NowPlayingMovieListItemWidget(
            movie: movieItems[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailScreen.routeName,
                arguments: MovieDetailArguments(
                  movieId: movieItems[index].id,
                  movieName: movieItems[index].title,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
