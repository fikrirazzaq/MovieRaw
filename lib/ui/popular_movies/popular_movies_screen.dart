import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_starter_app/bloc/bloc/movie_bloc.dart';
import 'package:movies_starter_app/ui/_reusable/movie_gridview_widget.dart';

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);
  static const String routeName = '/popular';

  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MovieBloc>().add(GetPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (prevState, nextState) {
          return nextState is GetPopularMoviesLoaded ||
              nextState is GetPopularMoviesError ||
              nextState is GetPopularMoviesLoading;
        },
        builder: (context, state) {
          if (state is GetPopularMoviesLoaded) {
            return MovieGridViewWidget(movie: state.movies);
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
      ),
    );
  }
}
