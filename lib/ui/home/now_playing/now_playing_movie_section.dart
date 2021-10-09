import 'package:flutter/material.dart';

import '../../../data/movies/model/movie_item_response.dart';
import '../../../data/movies/movie_api_client.dart';
import '../../now_playing_movies/now_playing_movies_screen.dart';
import 'popular_movie_horizontal_listview_widget.dart';

class NowPlayingMoviesSectionWidget extends StatefulWidget {
  const NowPlayingMoviesSectionWidget({Key? key}) : super(key: key);

  @override
  _NowPlayingMoviesSectionWidgetState createState() => _NowPlayingMoviesSectionWidgetState();
}

class _NowPlayingMoviesSectionWidgetState extends State<NowPlayingMoviesSectionWidget> {
  MovieApiClient _movieApiClient = MovieApiClient();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieItemResponse>?>(
      future: _movieApiClient.getNowPlayingMovies(),
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
                        'Today in Cinemas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, NowPlayingMoviesScreen.routeName);
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
