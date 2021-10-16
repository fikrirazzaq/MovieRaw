import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:movies_starter_app/data/movies/model/movie_detail_response.dart';
import 'package:movies_starter_app/data/movies/model/movie_item_response.dart';
import 'package:movies_starter_app/data/movies/remote/movie_api_client.dart';
import 'package:movies_starter_app/storage/hive_db.dart';
import 'package:movies_starter_app/ui/_model/movie_detail.dart';

import '../../../ui/_model/movie_item.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieItem>?> listPopularMovies();
  Future<List<MovieItem>?> listNowPlayingMovies();
  Future<MovieDetail?> detailMovie(String id);
  Future<List<MovieItem>?> listSearchMovies({required String keyword});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  MovieApiClient apiClient = MovieApiClient();

  @override
  Future<MovieDetail?> detailMovie(String id) async {
    try {
      MovieDetailResponse? response = await apiClient.getMovieDetail(id);
      if (response != null) {
        return MovieDetail.fromMovieDetailResponse(response);
      }
    } catch (error) {
      print('Error: detailMovie => $error');
    }

    return null;
  }

  @override
  Future<List<MovieItem>?> listNowPlayingMovies() async {
    try {
      List<MovieItemResponse>? responses =
          await apiClient.getNowPlayingMovies();
      if (responses != null) {
        return responses
            .map((e) => MovieItem.fromMovieItemResponse(e))
            .toList();
      }
    } catch (error) {
      print('Error: listNowPlayingMovies => $error');
    }

    return null;
  }

  @override
  Future<List<MovieItem>?> listPopularMovies() async {
    try {
      List<MovieItemResponse>? responses = await apiClient.getPopularMovies();
      if (responses != null) {
        return responses
            .map((e) => MovieItem.fromMovieItemResponse(e))
            .toList();
      }
    } catch (error) {
      print('Error: listPopularMovies => $error');
    }

    return null;
  }

  @override
  Future<List<MovieItem>?> listSearchMovies({required String keyword}) async {
    // TODO: implement listSearchMovies
    throw UnimplementedError();
  }
}
