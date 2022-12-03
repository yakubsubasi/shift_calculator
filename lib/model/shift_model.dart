import 'package:flutter/material.dart';
import 'package:shift_calculator/extensions.dart';
import 'package:shift_calculator/main.dart';

class Shift {
  int numberOfWorkers;
  int numberOfWorkingPlaces;
  DateTime startTime;
  int workingHours;
  int numberOfRows;
  List<List<int>> matrix = [];
  late double shiftDuraion;

  Shift({
    this.numberOfRows = 0,
    this.numberOfWorkers = 0,
    this.numberOfWorkingPlaces = 0,
    required this.startTime,
    this.workingHours = 16,
  }) {
    init();
  }

  @override
  String toString() {
    return 'Shift{numberOfWorkers: $numberOfWorkers, numberOfWorkingPlaces: $numberOfWorkingPlaces, numberOfRows: $numberOfRows,  matrix:\n ${matrix.toLineString()}}';
  }

  void init() {
    int rowNumber = numberOfWorkers;
    shiftDuraion = ((workingHours * 60) / rowNumber);

    // Make a algorithm to distribute workernumber that they are not in the same row and equally distributed in all columns

    for (var i = 0; i < rowNumber; i++) {
      matrix.add([]);
      double addedDuration = shiftDuraion * i;
      for (var j = 0; j < numberOfWorkingPlaces; j++) {
        matrix[i].add((i + j) % numberOfWorkers);
      }
    }
    matrix.shuffle();

/* 
    matrix.add(List.generate(numberOfWorkingPlaces, (index) => inxe)) */
  }
}
