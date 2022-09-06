import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink.shade200,
          scaffoldBackgroundColor: Colors.pink.shade600,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0.0)),
      home: Container(),
    );
  }
}
