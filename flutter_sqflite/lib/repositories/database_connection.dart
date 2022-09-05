import 'package:flutter_sqflite/models/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class DatabaseConnection {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "category.db");

    return await openDatabase(path, version: 1, onCreate: _onCreateDatabse);
  }

  _onCreateDatabse(Database db, int version) async {
    await db.execute(
        "CREATE TABLE categorias(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,description TEXT)");
  }

  Future<int> addItem(Category item) async {
    final db = await init();

    return db.insert("categorias", item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<Category>> fetchCategorias() async {
    final db = await init();
    final maps = await db.query("categorias");

    return List.generate(maps.length, (i) {
      return Category(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        description: maps[i]['description'] as String,
      );
    });
  }

  // Future<int> updateCategoria(int id, Category item) async {
  //   // returns the number of rows updated

  //   final db = await init();

  //   int result = await db
  //       .update("categorias", item.toMap(), where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

  Future<int> updateCategoria(int id, String name, String description) async {
    final db = await init();

    final data = {
      'name': name,
      'description': description,
    };

    //Category item = Category(id: id, name: name, description: description);

    return await db
        .update('categorias', data, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> readCategoryById(int id) async {
    final db = await init();
    return db.query('categorias', where: "id = ?", whereArgs: [id], limit: 1);
  }

  Future<int> deleteCategoria(int id) async {
    //returns number of items deleted
    final db = await init();

    int result =
        await db.delete("categorias", where: "id = ?", whereArgs: [id]);

    return result;
  }
}
