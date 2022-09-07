import 'dart:io';

import 'package:intl/date_symbol_data_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final dbname = "data.db";
  static final dbversion = 1;

  static final tablename = "acticties";
  static final columnid = "columnid";
  static final type = "type";
  static final data = "data";
  static final date = "date";

  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  late Database database;

  Future<Database> get db async {
    if (database != null) return database;

    return await initializeDatabase();
  }

  initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, dbname);
    return await openDatabase(path, version: dbversion, onCreate: createTable);
  }

  createTable(Database db, int version) {
    db.execute('''
      CREATE TABLE $tablename(
        $columnid INTEGER PRIMARY KEY,
        $type TEXT NOT NULL,
        $data REAL NOT NULL,
        $date TEXT NOT NULL
    )''');
    print("table created");
  }

  Future<int> addActivity(Map<String, dynamic> row) async {
    // Database db = await instance.db;
    Database db = await initializeDatabase();

    return await db.insert(tablename, row);
  }

  Future<List<Map<String, Object?>>> getActivities(String category) async {
    Database db = await initializeDatabase();

    if (category == "All") {
      return await db.rawQuery('SELECT * FROM acticties');
    } else {
      return await db.rawQuery('SELECT * FROM acticties WHERE type=? ',
          ['${category.toLowerCase()}']);
    }
  }
}
