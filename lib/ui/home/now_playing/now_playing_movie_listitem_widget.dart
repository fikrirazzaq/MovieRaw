import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../_model/movie_item.dart';
import '../../../data/movies/remote/movie_api_client.dart';

class NowPlayingMovieListItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final MovieItem movie;

  const NowPlayingMovieListItemWidget({
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
        child: SizedBox(
          width: 240,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: '$IMAGE_BASE_URL${movie.image}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.01),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${movie.title}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(0.4)),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amberAccent,
                        size: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${movie.rating}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
