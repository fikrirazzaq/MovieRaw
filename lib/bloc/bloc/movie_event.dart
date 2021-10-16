part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesEvent extends MovieEvent {}

class GetNowPlayingMoviesEvent extends MovieEvent {}

class GetMovieDetailEvent extends MovieEvent {
  final String id;
  GetMovieDetailEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class SearchMoviesEvent extends MovieEvent {
  final String keyword;

  SearchMoviesEvent({
    required this.keyword,
  });

  @override
  List<Object> get props => [keyword];
}

class GetFavoriteMoviesEvent extends MovieEvent {}

class AddMovieToFavoriteEvent extends MovieEvent {
  final MovieItem movieItem;
  AddMovieToFavoriteEvent({
    required this.movieItem,
  });

  @override
  List<Object> get props => [movieItem];
}

class RemoveMovieFromFavoriteEvent extends MovieEvent {
  final String id;

  RemoveMovieFromFavoriteEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
