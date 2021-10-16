import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_starter_app/bloc/bloc_observer.dart';
import 'package:movies_starter_app/storage/hive_db.dart';

import 'app.dart';

Future<void> main() async {
  runApp(MyApp());

  await HiveDb().initHiveDatabase();

  Bloc.observer = AppBlocObserver();
}
