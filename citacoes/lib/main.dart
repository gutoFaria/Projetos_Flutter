import 'package:flutter/material.dart';
import './citacoes.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Citacoes(),
    );
  }
}

class Citacoes extends StatefulWidget {
  @override
  State<Citacoes> createState() => _CitacoesState();
}

class _CitacoesState extends State<Citacoes> {
  //const Citacoes({Key? key}) : super(key: key);
  var citacao = "";

  var autor = "";

  void setCitacoes() {
    var randoNum = Random().nextInt(citacoes.length);

    setState(() {
      citacao = citacoes[randoNum]["text"]!;
      autor = citacoes[randoNum]["Autor"]!;
    });
  }

  @override
  void initState() {
    setCitacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Citações"),
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: setCitacoes,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.black, Colors.brown, Colors.purple])),
          child: Column(children: [
            Image.asset("citacoes.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              citacao,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              autor,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 185, 158, 158)),
            )
          ]),
        ));
  }
}
