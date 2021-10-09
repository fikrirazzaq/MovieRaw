import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_starter_app/data/movies/local/movies_local_data_source.dart';
import 'package:movies_starter_app/ui/_model/movie_item.dart';
import 'package:movies_starter_app/ui/_reusable/movie_gridview_widget.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  final MoviesLocalDataSource moviesLocalDataSource =
      MoviesLocalDataSourceImpl();

  // List<MovieItem> movies = [];
  @override
  void initState() {
    super.initState();

    // movies = moviesLocalDataSource.listFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ValueListenableBuilder<Box<MovieItem>>(
        valueListenable: moviesLocalDataSource.listenable(),
        builder: (context, box, child) {
          List<MovieItem> movies = box.values.toList();

          return MovieGridViewWidget(
            movie: movies,
          );
        },
      ),
    );
  }
}
