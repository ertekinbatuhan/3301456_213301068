import 'package:charts_flutter/flutter.dart' as charts;

class ChartModel {
  String foodName;
  int foodNumber;
  final charts.Color color;

  ChartModel({
    required this.foodName,
    required this.foodNumber,
    required this.color,
  });
}