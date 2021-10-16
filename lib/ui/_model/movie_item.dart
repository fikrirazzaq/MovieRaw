import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../data/movies/model/movie_detail_response.dart';
import '../../data/movies/model/movie_item_response.dart';
import 'movie_detail.dart';

part 'movie_item.g.dart';

@HiveType(typeId: 1)
class MovieItem extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final double rating;

  @HiveField(4)
  final DateTime? releaseDate;

  MovieItem({
    required this.id,
    required this.image,
    required this.title,
    this.rating = 0,
    required this.releaseDate,
  });

  factory MovieItem.fromMovieItemResponse(MovieItemResponse response) {
    return MovieItem(
      id: response.id ?? 0,
      image: response.posterPath ?? '',
      title: response.title ?? '',
      releaseDate: response.releaseDate == null
          ? null
          : DateTime.parse(response.releaseDate!),
      rating: response.voteAverage ?? 0,
    );
  }

  factory MovieItem.fromMovieDetail(MovieDetail movie) {
    return MovieItem(
      id: movie.id,
      image: movie.posterPath,
      title: movie.title,
      releaseDate: DateTime.parse(movie.releaseDate),
      rating: movie.voteAverage,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      image,
      title,
      rating,
      releaseDate,
    ];
  }
}
