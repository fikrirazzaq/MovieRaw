import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_starter_app/data/movies/model/movie_detail_response.dart';
import 'package:movies_starter_app/data/movies/movie_api_client.dart';

class MovieDetailBody extends StatefulWidget {
  final int movieId;

  const MovieDetailBody({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailBodyState createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {
  MovieApiClient _movieApiClient = MovieApiClient();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailResponse?>(
      future: _movieApiClient.getMovieDetail(widget.movieId.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            MovieDetailResponse movie = snapshot.data!;

            return Column(
              children: [
                CachedNetworkImage(
                  imageUrl: '$IMAGE_BASE_URL${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Text('${movie.overview}'),
                IconButton(
                  onPressed: () {
                    _movieApiClient.rateMovie(
                      movieId: movie.id.toString(),
                      rating: 9.0,
                    );
                  },
                  icon: Icon(Icons.rate_review),
                ),
              ],
            );
          } else {
            return Text('Data movie not found.');
          }
        }

        return CircularProgressIndicator();
      },
    );
  }
}
