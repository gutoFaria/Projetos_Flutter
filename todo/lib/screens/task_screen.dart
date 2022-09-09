import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/utils.dart';

//import '../models/task.dart';
import '../models/task_data.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown[300],
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen(() {
                      Navigator.pop(context);
                    }));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.brown,
                  ),
                  backgroundColor: Colors.white,
                  radius: 20.0),
              SizedBox(
                height: 5,
              ),
              Text(
                "Tarefas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${Provider.of<TaskData>(context).taskCount} Tarefas",
                style: textStyle(15, Colors.white, FontWeight.w200),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
