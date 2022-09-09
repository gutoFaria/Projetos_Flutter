import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  final Function checkboxCallback;
  final void Function() longPressCallback;

  TaskTile(
      {this.isChecked = false,
      required this.taskTile,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTile,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallback(newValue);
            // print("pressionado");
          }),
    );
  }
}
