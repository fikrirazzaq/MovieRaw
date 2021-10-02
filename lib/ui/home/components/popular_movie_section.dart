import 'package:flutter/material.dart';
import 'package:movies_starter_app/data/movies/model/movie_item_response.dart';
import 'package:movies_starter_app/data/movies/movie_api_client.dart';
import 'package:movies_starter_app/ui/_reusable/movie_horizontal_listview_widget.dart';
import 'package:movies_starter_app/ui/popular_movies/popular_movies_screen.dart';

class PopularMoviesSectionWidget extends StatefulWidget {
  const PopularMoviesSectionWidget({Key? key}) : super(key: key);

  @override
  _PopularMoviesSectionWidgetState createState() =>
      _PopularMoviesSectionWidgetState();
}

class _PopularMoviesSectionWidgetState
    extends State<PopularMoviesSectionWidget> {
  MovieApiClient _movieApiClient = MovieApiClient();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieItemResponse>?>(
      future: _movieApiClient.getPopularMovies(),
      builder: (context, AsyncSnapshot<List<MovieItemResponse>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            List<MovieItemResponse> movies = snapshot.data!;

            return Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('Popular')),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, PopularMoviesScreen.routeName);
                      },
                      child: Text('See All'),
                    ),
                  ],
                ),
                MovieHorizontalListViewWidget(
                  movieItems: movies,
                ),
              ],
            );
          } else {
            return Text('Error');
          }
        }

        return CircularProgressIndicator();
      },
    );
  }
}
