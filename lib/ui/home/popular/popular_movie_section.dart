import 'package:flutter/material.dart';

import '../../../data/movies/model/movie_item_response.dart';
import '../../../data/movies/movie_api_client.dart';
import '../../popular_movies/popular_movies_screen.dart';
import 'popular_movie_horizontal_listview_widget.dart';

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
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Popular Today',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, PopularMoviesScreen.routeName);
                      },
                      child: Text('See All'),
                    ),
                  ],
                ),
                PopularMovieHorizontalListViewWidget(movieItems: movies),
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
