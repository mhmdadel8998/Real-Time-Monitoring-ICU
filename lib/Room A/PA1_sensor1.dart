import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math' as math;
import 'package:icu_app/main.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
          LineSeries<LiveData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (LiveData sales, _) => sales.time,
            yValueMapper: (LiveData sales, _) => sales.speed,
          )
        ],
                primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 3,
                    title: AxisTitle(text: 'Time (seconds)')),
                primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Temperature (c)')))));
  }

  int time = 19;

  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, yvalue[yvalue.length - 1]));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 0),
      LiveData(1, 1),
      LiveData(2, 2),
      LiveData(3, 3),
      LiveData(4, 4),
      LiveData(5, 5),
      LiveData(6, 6),
      LiveData(7, 7),
      LiveData(8, 8),
      LiveData(9, 9),
      LiveData(10, 10),
      LiveData(11, 11),
      LiveData(12, 12),
      LiveData(13, 13),
      LiveData(14, 14),
      LiveData(15, 15),
      LiveData(16, 16),
      LiveData(17, 17),
      LiveData(18, 18),
      LiveData(19, 19),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
