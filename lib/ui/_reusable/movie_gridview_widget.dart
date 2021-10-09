import 'package:flutter/material.dart';
import 'package:movies_starter_app/ui/_model/movie_item.dart';
import 'package:movies_starter_app/ui/_reusable/movie_griditem_widget.dart';
import 'package:movies_starter_app/ui/movie_detail/movie_detail_screen.dart';
import '../../data/movies/model/movie_item_response.dart';

class MovieGridViewWidget extends StatelessWidget {
  final List<MovieItem> movie;

  const MovieGridViewWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
      ),
      itemCount: movie.length,
      itemBuilder: (context, index) {
        return MovieGridItemWidget(
          onTap: () {
            Navigator.pushNamed(
              context,
              MovieDetailScreen.routeName,
              arguments: MovieDetailArguments(
                movieId: movie[index].id,
                movieName: movie[index].title,
              ),
            );
          },
          movie: movie[index],
        );
      },
    );
  }
}
