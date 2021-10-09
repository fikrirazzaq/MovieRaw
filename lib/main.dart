import 'package:flutter/material.dart';
import 'package:movies_starter_app/storage/hive_db.dart';

import 'app.dart';

Future<void> main() async {
  runApp(MyApp());

  await HiveDb().initHiveDatabase();
}
