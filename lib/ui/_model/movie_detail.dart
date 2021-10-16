import 'package:equatable/equatable.dart';
import 'package:movies_starter_app/data/movies/model/movie_detail_response.dart';

class MovieDetail extends Equatable {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<Genre> genres;
  final int id;
  final String imdbId;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      adult,
      backdropPath,
      budget,
      genres,
      id,
      imdbId,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      releaseDate,
      revenue,
      runtime,
      tagline,
      title,
      voteAverage,
      voteCount,
    ];
  }

  factory MovieDetail.fromMovieDetailResponse(MovieDetailResponse response) {
    return MovieDetail(
      adult: response.adult ?? false,
      backdropPath: response.backdropPath ?? '',
      budget: response.budget ?? 0,
      genres: response.genres != null
          ? response.genres!.map((e) => Genre.fromGenreResponse(e)).toList()
          : [],
      id: response.id ?? 0,
      imdbId: response.imdbId ?? '',
      overview: response.overview ?? '',
      popularity: response.popularity ?? 0,
      posterPath: response.posterPath ?? '',
      productionCompanies: response.productionCompanies != null
          ? response.productionCompanies!
              .map((e) => ProductionCompany.fromProductionCompanyResponse(e))
              .toList()
          : [],
      releaseDate: response.releaseDate ?? '',
      revenue: response.revenue ?? 0,
      runtime: response.runtime ?? 0,
      tagline: response.tagline ?? '',
      title: response.title ?? '',
      voteAverage: response.voteAverage ?? 0,
      voteCount: response.voteCount ?? 0,
    );
  }
}

class Genre extends Equatable {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  factory Genre.fromGenreResponse(GenreResponse response) {
    return Genre(id: response.id ?? 0, name: response.name ?? '');
  }
}

class ProductionCompany extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  @override
  List<Object> get props => [id, logoPath, name, originCountry];

  factory ProductionCompany.fromProductionCompanyResponse(
      ProductionCompanyResponse response) {
    return ProductionCompany(
      id: response.id ?? 0,
      logoPath: response.logoPath ?? '',
      name: response.name ?? '',
      originCountry: response.originCountry ?? '',
    );
  }
}
