import 'package:flutter/material.dart';
import 'package:movies_starter_app/data/movies/remote/movie_remote_data_source.dart';
import 'package:movies_starter_app/ui/_model/movie_item.dart';

import '../../now_playing_movies/now_playing_movies_screen.dart';
import 'now_playing_movie_listview_widget.dart';

class NowPlayingMoviesSectionWidget extends StatefulWidget {
  const NowPlayingMoviesSectionWidget({Key? key}) : super(key: key);

  @override
  _NowPlayingMoviesSectionWidgetState createState() =>
      _NowPlayingMoviesSectionWidgetState();
}

class _NowPlayingMoviesSectionWidgetState
    extends State<NowPlayingMoviesSectionWidget> {
  MoviesRemoteDataSource _remoteDataSource = MoviesRemoteDataSourceImpl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieItem>?>(
      future: _remoteDataSource.listNowPlayingMovies(),
      builder: (context, AsyncSnapshot<List<MovieItem>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            List<MovieItem> movieItems = snapshot.data!;

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
                NowPlayingMovieListViewWidget(movieItems: movieItems),
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
