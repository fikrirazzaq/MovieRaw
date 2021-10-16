import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:movies_starter_app/bloc/bloc/movie_bloc.dart';
import 'package:movies_starter_app/data/movies/local/movies_local_data_source.dart';
import 'package:movies_starter_app/data/movies/remote/movie_api_client.dart';
import 'package:movies_starter_app/ui/_model/movie_detail.dart';
import 'package:movies_starter_app/ui/_model/movie_item.dart';
import 'package:movies_starter_app/ui/_reusable/sliver/sliver_view_widget.dart';

class MovieDetailBody extends StatefulWidget {
  final int movieId;

  const MovieDetailBody({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailBodyState createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {
  List<int> favoritedIds = [];

  @override
  void initState() {
    super.initState();

    context
        .read<MovieBloc>()
        .add(GetMovieDetailEvent(id: widget.movieId.toString()));

    context.read<MovieBloc>().add(GetFavoriteMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listenWhen: listenWhen,
      listener: listener,
      buildWhen: (prevState, nextState) =>
          nextState is GetMovieDetailLoaded ||
          nextState is GetMovieDetailError ||
          nextState is GetMovieDetailLoading,
      builder: (context, state) {
        if (state is GetMovieDetailLoaded) {
          MovieDetail movie = state.movie;

          bool isFavorite = favoritedIds.contains(movie.id);

          return SliverViewWidget(
            title: movie.title,
            imageUrl: "$IMAGE_BASE_URL${movie.posterPath}",
            body: _buildBody(movie),
            onFavoritePressed: () {
              if (isFavorite) {
                context
                    .read<MovieBloc>()
                    .add(RemoveMovieFromFavoriteEvent(id: movie.id.toString()));
              } else {
                context.read<MovieBloc>().add(AddMovieToFavoriteEvent(
                    movieItem: MovieItem.fromMovieDetail(movie)));
              }
            },
            isFavorite: isFavorite,
          );
        }

        if (state is GetMovieDetailError) {
          return Column(
            children: [
              Text(state.message),
              IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
            ],
          );
        }

        return CircularProgressIndicator();
      },
    );
  }

  bool listenWhen(MovieState prevState, MovieState nextState) =>
      nextState is AddMovieToFavoriteError ||
      nextState is RemoveMovieFromFavoriteError ||
      nextState is AddMovieToFavoriteSuccess ||
      nextState is RemoveMovieFromFavoriteSuccess ||
      nextState is GetFavoriteMoviesLoaded;

  void listener(BuildContext context, MovieState state) {
    if (state is AddMovieToFavoriteError) {
      Fluttertoast.showToast(msg: 'Failed to Add Favorite');
    }
    if (state is RemoveMovieFromFavoriteError) {
      Fluttertoast.showToast(msg: 'Failed to Remove Favorite');
    }

    if (state is AddMovieToFavoriteSuccess) {
      Fluttertoast.showToast(msg: 'Success Add to Favorite');
      context.read<MovieBloc>().add(GetFavoriteMoviesEvent());
    }

    if (state is RemoveMovieFromFavoriteSuccess) {
      Fluttertoast.showToast(msg: 'Success Remove from Favorite');
      context.read<MovieBloc>().add(GetFavoriteMoviesEvent());
    }

    if (state is GetFavoriteMoviesLoaded) {
      setState(() {
        favoritedIds = state.movies.map((e) => e.id).toList();
      });
    }
  }

  Column _buildBody(MovieDetail movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${movie.title}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              '${movie.runtime} minutes',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Expanded(child: SizedBox.shrink()),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amberAccent,
                  size: 12,
                ),
                SizedBox(width: 4),
                Text(
                  '${movie.voteAverage}',
                  style: TextStyle(),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: movie.genres.map((e) => Chip(label: Text(e.name))).toList(),
        ),
        SizedBox(height: 16),
        Text(
          '${movie.overview}',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 54,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movie.productionCompanies
                .map(
                  (e) => CachedNetworkImage(
                    imageUrl: "$IMAGE_BASE_URL${e.logoPath}",
                    height: 54,
                  ),
                )
                .toList(),
          ),
        ),
        Text(
          '${movie.productionCompanies.map((e) => e.name)}',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
