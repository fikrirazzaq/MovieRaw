import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_starter_app/data/movies/model/movie_item_response.dart';
import 'package:movies_starter_app/data/movies/movie_api_client.dart';

class MovieHorizontalListItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final MovieItemResponse movieItemResponse;

  const MovieHorizontalListItemWidget({
    Key? key,
    required this.movieItemResponse,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: '$IMAGE_BASE_URL${movieItemResponse.posterPath}',
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 32, child: Text('${movieItemResponse.title}')),
            ],
          ),
        ),
      ),
    );
  }
}
