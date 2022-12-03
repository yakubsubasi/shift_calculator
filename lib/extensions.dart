import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0}) {
    if (this.minute + minute >= 60) {
      hour++;
      minute = (this.minute + minute) - 60;
    } else {
      minute = this.minute + minute;
    }

    return replacing(hour: this.hour + hour, minute: this.minute + minute);
  }
}

extension ListExtension<T> on List<T> {
  // method that makes a line after each element
  String toLineString() {
    String result = '';
    for (var i = 0; i < length; i++) {
      result += this[i].toString() + ' \n ';
    }
    return result;
  }
}
