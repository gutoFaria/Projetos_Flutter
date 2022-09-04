import 'package:flutter/material.dart';
import 'package:flutter_sqflite/helpers/drawer_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Todo List'),
        backgroundColor: Colors.brown,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
