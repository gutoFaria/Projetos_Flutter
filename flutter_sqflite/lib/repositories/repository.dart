// import 'package:sqflite/sqflite.dart';
// import '../models/category.dart';
// import 'database_connection.dart';

// class Repository {
//   DatabaseConnection? _databaseConnection;

//   Repository() {
//     _databaseConnection = DatabaseConnection();
//   }

//   static Database? _database;

//   Future<Database?> get database async {
//     if (database != null) {
//       _database = await _databaseConnection?.init();
//     }

//     return _database;
//   }

//   Future<int> insertData(Category item) async {
//     //final db = await init();

//     return _database.insert("categorias", item.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.ignore);
//   }
// }
