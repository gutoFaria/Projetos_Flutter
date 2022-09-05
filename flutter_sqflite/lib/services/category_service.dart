import 'package:flutter_sqflite/repositories/repository.dart';

import '../models/category.dart';
import '../repositories/database_connection.dart';

class CategoryService {
  DatabaseConnection? _databaseConnection;

  CategoryService() {
    _databaseConnection = DatabaseConnection();
  }

  saveCategory(Category category) async {
    return await _databaseConnection?.addItem(category);
  }
}
