import 'package:calculadora/components/button.dart';
import 'package:calculadora/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  Keyboard(this.cb);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      height: 500,
      child: Column(children: [
        SizedBox(
          height: 1,
        ),
        ButtonRow([
          Button(text: 'AC', big: true, cb: cb),
          Button(text: '%', color: Button.operation, cb: cb),
          Button(text: '/', color: Button.operation, cb: cb),
        ]),
        SizedBox(
          height: 1,
        ),
        ButtonRow([
          Button(text: '7', cb: cb),
          Button(text: '8', cb: cb),
          Button(text: '9', cb: cb),
          Button(text: 'x', color: Button.operation, cb: cb),
        ]),
        SizedBox(
          height: 1,
        ),
        ButtonRow([
          Button(text: '4', cb: cb),
          Button(text: '5', cb: cb),
          Button(text: '6', cb: cb),
          Button(text: '-', color: Button.operation, cb: cb),
        ]),
        SizedBox(
          height: 1,
        ),
        ButtonRow([
          Button(text: '1', cb: cb),
          Button(text: '2', cb: cb),
          Button(text: '3', cb: cb),
          Button(text: '+', color: Button.operation, cb: cb),
        ]),
        SizedBox(
          height: 1,
        ),
        ButtonRow([
          Button(text: '0', big: true, cb: cb),
          Button(text: '.', cb: cb),
          Button(text: '=', color: Button.operation, cb: cb),
        ]),
      ]),
    );
  }
}
