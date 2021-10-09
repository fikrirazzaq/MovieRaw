import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_starter_app/data/movies/model/movie_item_response.dart';
import 'package:movies_starter_app/data/movies/remote/movie_api_client.dart';

class PopularMovieListItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final MovieItemResponse movie;

  const PopularMovieListItemWidget({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: '$IMAGE_BASE_URL${movie.posterPath}',
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
