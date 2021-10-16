import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_starter_app/bloc/bloc/movie_bloc.dart';

import '../../popular_movies/popular_movies_screen.dart';
import 'popular_movie_listview_widget.dart';

class PopularMoviesSectionWidget extends StatefulWidget {
  const PopularMoviesSectionWidget({Key? key}) : super(key: key);

  @override
  _PopularMoviesSectionWidgetState createState() =>
      _PopularMoviesSectionWidgetState();
}

class _PopularMoviesSectionWidgetState
    extends State<PopularMoviesSectionWidget> {
  @override
  void initState() {
    super.initState();

    context.read<MovieBloc>().add(GetPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (prevState, nextState) {
        return nextState is GetPopularMoviesLoaded ||
            nextState is GetPopularMoviesError ||
            nextState is GetPopularMoviesLoading;
      },
      builder: (context, state) {
        if (state is GetPopularMoviesLoaded) {
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Popular Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, PopularMoviesScreen.routeName);
                    },
                    child: Text('See All'),
                  ),
                ],
              ),
              PopularMovieListViewWidget(movieItems: state.movies),
            ],
          );
        }

        if (state is GetPopularMoviesError) {
          return Column(
            children: [
              Text(state.message),
              IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
            ],
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
