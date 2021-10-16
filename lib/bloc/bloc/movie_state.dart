part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class InitialMoviesState extends MovieState {}

/// Get Popular Movies
class GetPopularMoviesLoading extends MovieState {}

class GetPopularMoviesLoaded extends MovieState {
  final List<MovieItem> movies;
  GetPopularMoviesLoaded({
    required this.movies,
  });

  @override
  List<Object?> get props => [movies];
}

class GetPopularMoviesError extends MovieState {
  final String message;
  GetPopularMoviesError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

/// Now Playing Movies
class GetNowPlayingMoviesLoading extends MovieState {}

class GetNowPlayingMoviesLoaded extends MovieState {
  final List<MovieItem> movies;

  GetNowPlayingMoviesLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class GetNowPlayingMoviesError extends MovieState {
  final String message;

  GetNowPlayingMoviesError({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Movie Detail
class GetMovieDetailLoading extends MovieState {}

class GetMovieDetailLoaded extends MovieState {
  final MovieDetail movie;

  GetMovieDetailLoaded({required this.movie});
  @override
  List<Object?> get props => [movie];
}

class GetMovieDetailError extends MovieState {
  final String message;

  GetMovieDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Favorite Movies
class GetFavoriteMoviesLoading extends MovieState {}

class GetFavoriteMoviesLoaded extends MovieState {
  final List<MovieItem> movies;

  GetFavoriteMoviesLoaded({required this.movies});
  @override
  List<Object?> get props => [movies];
}

class GetFavoriteMoviesError extends MovieState {
  final String message;

  GetFavoriteMoviesError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Add To Favorite
class AddMovieToFavoriteLoading extends MovieState {}

class AddMovieToFavoriteSuccess extends MovieState {}

class AddMovieToFavoriteError extends MovieState {
  final String message;

  AddMovieToFavoriteError({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Remove Movie From Favorite
class RemoveMovieFromFavoriteLoading extends MovieState {}

class RemoveMovieFromFavoriteSuccess extends MovieState {}

class RemoveMovieFromFavoriteError extends MovieState {
  final String message;

  RemoveMovieFromFavoriteError({required this.message});

  @override
  List<Object?> get props => [message];
}
