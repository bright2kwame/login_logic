import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ManageDatabase {
  Future<Database> initialise() async {
// Open the database and store the reference.
    final database = openDatabase(
      join(await getDatabasesPath(), 'home_now_database.db'),
      onCreate: (db, version) async {
        // Run the CREATE users TABLE statement on the database.
        await db.execute(
          'CREATE TABLE users(id TEXT PRIMARY KEY, firstName TEXT, lastName TEXT, fullName TEXT, email TEXT)',
        );
        return;
      },
      version: 1,
    );
    return database;
  }
}
