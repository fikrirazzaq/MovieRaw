import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_starter_app/bloc/bloc/movie_bloc.dart';
import 'package:movies_starter_app/ui/_reusable/movie_gridview_widget.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MovieBloc>().add(GetFavoriteMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (prevState, nextState) {
          return nextState is GetFavoriteMoviesLoaded ||
              nextState is GetFavoriteMoviesError ||
              nextState is GetFavoriteMoviesLoading;
        },
        builder: (context, state) {
          if (state is GetFavoriteMoviesLoaded) {
            return MovieGridViewWidget(
              movie: state.movies,
            );
          }

          if (state is GetFavoriteMoviesError) {
            return Column(
              children: [
                Text(state.message),
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
              ],
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
