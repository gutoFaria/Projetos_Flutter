import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/utils/utils.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaslCallback;

  late String newTaskTile;

  AddTaskScreen(this.addTaslCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Adicionar Tarefa",
              textAlign: TextAlign.center,
              style: textStyle(30.0, Colors.brown, FontWeight.w400),
            ),
            TextField(
              //autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTile = newText;
              },
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.brown[400]),
              child: Text(
                "Adicionar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Provider?.of<TaskData>(context, listen: false)
                    .addTask(newTaskTile);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
