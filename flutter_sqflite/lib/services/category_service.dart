import 'package:flutter_sqflite/repositories/repository.dart';

import '../models/category.dart';

class CategoryService {
  Repository? _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository?.insertData('categorias', category.categoryMap());
  }
}
