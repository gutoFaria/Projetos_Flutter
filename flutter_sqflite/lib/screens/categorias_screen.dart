import 'package:flutter/material.dart';
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

  var _category = Category();
  var _categoryService = CategoryService();

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

                  var result = await _categoryService.saveCategory(_category);
                  print(result);
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
        body: Center(child: Text('Crie Categorias')),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showFormDialog(context);
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.brown));
  }
}
