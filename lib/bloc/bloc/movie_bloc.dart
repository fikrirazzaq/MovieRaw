import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_starter_app/data/movies/local/movies_local_data_source.dart';
import 'package:movies_starter_app/data/movies/remote/movie_remote_data_source.dart';
import 'package:movies_starter_app/ui/_model/movie_detail.dart';
import 'package:movies_starter_app/ui/_model/movie_item.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MoviesRemoteDataSource remote = MoviesRemoteDataSourceImpl();
  MoviesLocalDataSource local = MoviesLocalDataSourceImpl();

  MovieBloc() : super(InitialMoviesState()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      emit(GetPopularMoviesLoading());

      List<MovieItem>? movies = await remote.listPopularMovies();

      if (movies == null) {
        // Error
        emit(GetPopularMoviesError(message: 'Failed to get movies'));
      } else {
        // Loaded
        emit(GetPopularMoviesLoaded(movies: movies));
      }
    });

    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(GetNowPlayingMoviesLoading());

      List<MovieItem>? movies = await remote.listPopularMovies();

      if (movies == null) {
        // Error
        emit(GetNowPlayingMoviesError(message: 'Failed to get movies'));
      } else {
        // Loaded
        emit(GetNowPlayingMoviesLoaded(movies: movies));
      }
    });

    on<GetMovieDetailEvent>((event, emit) async {
      emit(GetMovieDetailLoading());

      MovieDetail? movie = await remote.detailMovie(event.id);

      if (movie == null) {
        // Error
        emit(GetMovieDetailError(message: 'Failed to get movies'));
      } else {
        // Loaded
        emit(GetMovieDetailLoaded(movie: movie));
      }
    });

    on<GetFavoriteMoviesEvent>((event, emit) async {
      emit(GetFavoriteMoviesLoading());

      try {
        List<MovieItem> movies = local.listFavorite();
        emit(GetFavoriteMoviesLoaded(movies: movies));
      } catch (e) {
        emit(GetFavoriteMoviesError(message: 'Failed to get movies'));
      }
    });

    on<AddMovieToFavoriteEvent>((event, emit) async {
      emit(AddMovieToFavoriteLoading());

      try {
        local.putToFavorite(event.movieItem.id.toString(), event.movieItem);
        emit(AddMovieToFavoriteSuccess());
      } catch (e) {
        emit(AddMovieToFavoriteError(message: 'Failed to get movies'));
      }
    });

    on<RemoveMovieFromFavoriteEvent>((event, emit) async {
      emit(RemoveMovieFromFavoriteLoading());

      try {
        local.deleteFromFavorite(event.id);
        emit(RemoveMovieFromFavoriteSuccess());
      } catch (e) {
        emit(RemoveMovieFromFavoriteError(message: 'Failed to get movies'));
      }
    });
  }
}
