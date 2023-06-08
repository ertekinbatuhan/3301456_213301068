import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


import 'chart_model.dart';

class ChartHomePage extends StatelessWidget {
  ChartHomePage({Key? key}) : super(key: key);
  final List<ChartModel> data = [
    ChartModel(
      foodName: "Baklava",
      foodNumber: 300,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    ChartModel(
      foodName: "Cola",
      foodNumber: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    ChartModel(
      foodName: "Su",
        foodNumber: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ChartModel(
      foodName: "Döner",
      foodNumber: 551,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    ChartModel(
      foodName: "Adana",
      foodNumber: 705,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    ChartModel(
      foodName: "Ekler",
      foodNumber: 1000,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    ChartModel(
      foodName: "Fanta",
      foodNumber: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),


  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartModel, String>> series = [
      charts.Series(
        id: "coksatanlar",
        data: data,
        domainFn: (ChartModel series, _) => series.foodName,
        measureFn: (ChartModel series, _) => series.foodNumber,
        colorFn: (ChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("En Çok Satılanlar"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}