import 'package:flutter/material.dart';
import 'package:shift_calculator/main.dart';

import '../model/shift_model.dart';

class ShiftController extends ChangeNotifier {
  int numberOfWorkers = 0;

  set setNumberOfWorkers(int value) {
    numberOfWorkers = value;
    notifyListeners();
  }

  int numberOfWorkingPlaces = 0;

  set setNumberOfWorkingPlaces(int value) {
    numberOfWorkingPlaces = value;
    notifyListeners();
  }

  List<String> workers = [];

  List<String> workingPlaces = [];

  Shift shift = Shift(
    startTime: DateTime(2022, 1, 1, 8, 30),
    numberOfWorkers: 0,
    numberOfWorkingPlaces: 0,
  );

  void calcShift() {
    shift = Shift(
      numberOfWorkers: numberOfWorkers,
      numberOfWorkingPlaces: numberOfWorkingPlaces,
      startTime: DateTime(2022, 1, 1, 8, 30),
    );
    notifyListeners();
  }

  void setWorkerName(int index, String value) {
    workers[index] = value;
    notifyListeners();
  }

  void setWorkingPlaceName(int index, String value) {
    workingPlaces[index] = value;
    notifyListeners();
  }
}
