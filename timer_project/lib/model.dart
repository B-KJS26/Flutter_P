import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  Database? db;

  Future<Database?> openDb() async {
    // ignore: prefer_conditional_assignment
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'maple.db'),
          onCreate: (database, version) {
        database.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, level INTEGER)');
      }, version: version);
    }
    return db;
  }
}
