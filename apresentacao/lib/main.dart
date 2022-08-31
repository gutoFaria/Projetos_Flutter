import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        title: 'Augusto Faria',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Éster Augusto"),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Column(children: [
            Image.network(
              height: 300,
              width: 500,
              "https://avatars.githubusercontent.com/u/61546216?v=4",
            ),
            Container(
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Éster Augusto",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 38),
                        ),
                        Text(
                          "Desenvolvedor backend, aprendiz mobile",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.email),
                            Text("acuralog@hotmail.com")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone),
                            Text("(37) 99821-1438")
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Sobre:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("Estudante de Engenharia da Computação ingressando atualmente no 6° " +
                            "período da disciplina,tendo realizado alguns projetos acadêmicos e outros " +
                            "para aprendizado pessoal na área de desenvolvimento de software."),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              "Portifólio github: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("https://github.com/gutoFaria")
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Linjedin: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("https://www.linkedin.com/in/esteraugusto/")
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    )))
          ])),
        ));
  }
}
