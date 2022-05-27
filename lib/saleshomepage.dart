import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icu_app/sales.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:async';
import 'dart:math' as math;

class SalesHomePage extends StatefulWidget {
  @override
  _SalesHomePageState createState() {
    return _SalesHomePageState();
  }
}

class _SalesHomePageState extends State<SalesHomePage> {
  late List<charts.Series<Sales, double>> series;

  // late List<charts.Series<Sales, String>> _seriesBarData;
  late List<Sales> mydata;
  _generateData(mydata) {
    series = <charts.Series<Sales, double>>[];
    series.add(
      charts.Series(
          id: "Sales",
          data: mydata,
          domainFn: (Sales sales, _) => double.parse(sales.humidity),
          measureFn: (Sales sales, _) => double.parse(sales.temperature),
          colorFn: (Sales sales, _) =>
              charts.ColorUtil.fromDartColor(Colors.red)),
      // charts.Series(
      //   domainFn: (Sales sales, _) => sales.humidity.toString(),
      //   measureFn: (Sales sales, _) => sales.temperature,
      //   colorFn: (Sales sales, _) => charts.ColorUtil.fromDartColor(Colors.red),
      //   id: 'Sales',
      //   data: mydata,
      //   labelAccessorFn: (Sales row, _) => "${row.humidity}",
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Patient-1', style: TextStyle(fontSize: 30))),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('sales').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Sales> sales = snapshot.data!.docs
              .map((documentSnapshot) => Sales.fromMap(
                  documentSnapshot.data() as Map<String, dynamic>))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Sales> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Scaffold(
      body: ListView(children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 300,
            width: double.infinity,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Temperature ',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: charts.LineChart(series,
                        domainAxis: const charts.NumericAxisSpec(
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                              zeroBound: false),
                          viewport: charts.NumericExtents(2016.0, 2022.0),
                        ),
                        behaviors: [charts.PanAndZoomBehavior()],
                        animate: true),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          height: 300,
          width: double.infinity,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Pressure ',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: charts.LineChart(series,
                      domainAxis: const charts.NumericAxisSpec(
                        tickProviderSpec: charts.BasicNumericTickProviderSpec(
                            zeroBound: false),
                        viewport: charts.NumericExtents(2016.0, 2022.0),
                      ),
                      behaviors: [charts.PanAndZoomBehavior()],
                      animate: true),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
