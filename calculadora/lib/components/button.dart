import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const black = Colors.black;
  static const DEFAULT = Color.fromARGB(255, 121, 99, 99);
  static const operation = Colors.purple;
  final void Function(String) cb;

  final String text;
  final bool big;
  final Color color;

  Button(
      {required this.text,
      this.big = false,
      this.color = DEFAULT,
      required this.cb});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: big ? 2 : 1,
        child: TextButton(
            onPressed: () => cb(text),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: color)));
  }
}
