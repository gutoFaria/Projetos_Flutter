import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils.dart';
import 'package:pomodoro/widgets/progress_widget.dart';
import 'package:pomodoro/widgets/time_controller.dart';
import 'package:pomodoro/widgets/time_options.dart';
import 'package:pomodoro/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class PromodoroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: rederColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: rederColor(provider.currentState),
        title: Text(
          "PROMOTIMER",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          TimerCard(),
          SizedBox(
            height: 30,
          ),
          TimeOptions(),
          SizedBox(
            height: 30,
          ),
          TimeController(),
          SizedBox(
            height: 20,
          ),
          ProgressWidget()
        ]),
      )),
    );
  }
}
