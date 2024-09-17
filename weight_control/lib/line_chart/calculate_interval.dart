import 'package:flutter/material.dart';

class CalculateInterval {
  ValueNotifier<double> zoomLevel;
  int daysInMonth;
  int totalDays = 30;

  CalculateInterval({double initialZoomLevel = 1.0, this.daysInMonth = 30})
      : zoomLevel = ValueNotifier<double>(initialZoomLevel);

  void setZoomLevel(double newZoomLevel) {
    zoomLevel.value = newZoomLevel;
  }

  double getWidthPerDay(Size size) {
    return size.width / totalDays;
  }

  Map<String, dynamic> getInterval() {
    int interval;
    DateTime intervalStartDate;


    if (zoomLevel.value > 0.7) {
      interval = 4;
      totalDays = daysInMonth;
    } else if (zoomLevel.value > 0.5 && zoomLevel.value <= 0.7) {
      interval = 30;
      totalDays = 180; // 6 months
    } else if (zoomLevel.value > 0.3 && zoomLevel.value <= 0.5) {
      interval = 60;
      totalDays = 365; // 1 year
    } else if (zoomLevel.value > 0.1 && zoomLevel.value <= 0.3) {
      interval = 90;
      totalDays = 540; // 18 months
    } else {
      interval = 120;
      totalDays = 730; // 2 years
    }
    intervalStartDate = DateTime.now().subtract(Duration(days: totalDays));
    return {
      'interval': interval,
      'totalDays': totalDays,
      'intervalStartDate': intervalStartDate.toString()};
  }
}