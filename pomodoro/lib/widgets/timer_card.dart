import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    return Column(
      children: [
        Text(
          provider.currentState,
          style: textStyle(20, Colors.white, FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ]),
              child: Center(
                  child: Text((provider.currentDuration ~/ 60).toString(),
                      style: textStyle(70, rederColor(provider.currentState),
                          FontWeight.bold))),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(
                  60, rederColor(provider.currentState), FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ]),
              child: Center(
                  child: Text(
                      seconds == 0
                          ? "${seconds.round()}0"
                          : seconds.round().toString(),
                      style: textStyle(70, rederColor(provider.currentState),
                          FontWeight.bold))),
            ),
          ],
        )
      ],
    );
  }
}
