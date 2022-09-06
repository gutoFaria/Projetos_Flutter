import 'package:flutter/material.dart';
import 'dart:async';

class TimerService extends ChangeNotifier {
  late Timer timer;
  late double currentDuration = 1500;
  late double selectedTime = 1500;
  late bool timerPlaying = false;
  late int rounds = 0;
  late int goal = 0;
  late String currentState = "FOCUS";

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRount();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 1500;
    rounds = 0;
    goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;

    notifyListeners();
  }

  void handleNextRount() {
    if (currentState.contains("FOCUS") && rounds != 3) {
      currentState = "BREAK";
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      goal++;
    } else if (currentState.contains("BREAK")) {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState.contains("FOCUS") && rounds == 3) {
      currentState = "LONGBREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
    } else if (currentState.contains("LONGBREAK")) {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
      //goal = 0;
    }
    notifyListeners();
  }
}