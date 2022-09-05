import 'package:flutter/material.dart';
import 'package:flutter_sqflite/repositories/database_connection.dart';
import 'package:flutter_sqflite/services/category_service.dart';

import '../models/category.dart';
import 'home_screen.dart';

class CategoriasScreen extends StatefulWidget {
  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var category;
  var _editcategoryNameController = TextEditingController();
  var _editcategoryDescriptionController = TextEditingController();
  var _editcategoryIdController = TextEditingController();

  var _category = Category(description: '', name: '', id: 0);
  var _categoryService = CategoryService();
  var _databaseConnection = DatabaseConnection();

  List<Category> _categoryList = [];

  @override
  void initState() {
    super.initState();
    getAllCategorias();
  }

  getAllCategorias() async {
    var categorias = await _databaseConnection.fetchCategorias();
    categorias.forEach((category) {
      setState(() {
        var categoryModel = Category(id: 0, name: '', description: '');
        categoryModel.name = category.name.toString();
        categoryModel.description = category.description.toString();
        categoryModel.id = category.id;
        _categoryList.add(categoryModel);
      });
    });
  }

  _editCategory(BuildContext context, categoryId) async {
    var _category = await _databaseConnection.readCategoryById(categoryId);
    setState(() {
      _editcategoryIdController.text = _category[0]['id'].toString();
      _editcategoryNameController.text = _category[0]['name'] ?? 'não há nome';
      _editcategoryDescriptionController.text =
          _category[0]['description'] ?? 'não há descrição';
    });
    _editFormDialog(context);
  }

  _deleteCategory(BuildContext context, categoryId) async {
    var _category = await _databaseConnection.readCategoryById(categoryId);
    setState(() {
      _editcategoryIdController.text = _category[0]['id'].toString();
    });
    _deleteFormDialog(context);
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () async {
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;

                  var result = await _databaseConnection.addItem(_category);
                  if (result > 0) {
                    Navigator.pop(context);
                    print(result);
                    getAllCategorias();
                  }
                },
                child: Text('Salvar'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, primary: Colors.white),
              ),
            ],
            title: Text('Categorias'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                      hintText: 'Escreva uma Categoria',
                      labelText: 'Categoria'),
                ),
                TextField(
                  controller: _categoryDescriptionController,
                  decoration: InputDecoration(
                      hintText: 'Escreva uma Descrição',
                      labelText: 'Descrição'),
                ),
              ],
            )),
          );
        });
  }

  _editFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () async {
                  _category.id = int.parse(_editcategoryIdController.text);
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;

                  var result = await _databaseConnection.updateCategoria(
                      _category.id, _category.name, _category.description);
                  if (result > 0) {
                    Navigator.pop(context);
                    print(result);
                    getAllCategorias();
                  }
                },
                child: Text('Editar'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, primary: Colors.white),
              ),
            ],
            title: Text('Categorias'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: _editcategoryNameController,
                  decoration: InputDecoration(
                      hintText: ' Editar Categoria', labelText: 'Categoria'),
                ),
                TextField(
                  controller: _editcategoryDescriptionController,
                  decoration: InputDecoration(
                      hintText: 'Escreva uma Descrição',
                      labelText: 'Descrição'),
                ),
              ],
            )),
          );
        });
  }

  _deleteFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () async {
                  _category.id = int.parse(_editcategoryIdController.text);
                  var result =
                      await _databaseConnection.deleteCategoria(_category.id);
                  if (result > 0) {
                    Navigator.pop(context);
                    print(result);
                    getAllCategorias();
                  }
                },
                child: Text('Deletar'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, primary: Colors.white),
              ),
            ],
            title: Text('Deletar Categoria?'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
            child: Icon(Icons.arrow_back),
            style: TextButton.styleFrom(primary: Colors.white, elevation: 0.0),
          ),
          centerTitle: true,
          title: Text('Categorias'),
          backgroundColor: Colors.brown,
        ),
        body: ListView.builder(
            itemCount: _categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: Card(
                  color: Colors.brown[400],
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.amber[400],
                      onPressed: () {
                        _editCategory(context, _categoryList[index].id);
                      },
                    ),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _categoryList[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                _deleteCategory(
                                    context, _categoryList[index].id);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 179, 17, 5),
                              ))
                        ]),
                    subtitle: Text(_categoryList[index].description),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showFormDialog(context);
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.brown));
  }
}
