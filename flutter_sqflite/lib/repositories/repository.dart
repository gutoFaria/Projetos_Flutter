import 'package:sqflite/sqflite.dart';
import 'database_connection.dart';

class Repository {
  DatabaseConnection? _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (database != null) {
      _database = await _databaseConnection?.setDatabase();
    }

    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }
}
