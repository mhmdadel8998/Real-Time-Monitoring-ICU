import 'package:flutter/material.dart';
import 'package:icu_app/Room A/PA1-sensor2.dart';
import 'package:icu_app/Room A/ROOM_A.dart';
import 'package:icu_app/Room B/ROOM_B.dart';
import 'package:icu_app/Room A/Patient_A2.dart';
import 'package:icu_app/main.dart';
import 'package:icu_app/Room A/PA1_sensor1.dart';

class Patient_A1 extends StatefulWidget {
  const Patient_A1({Key? key}) : super(key: key);

  @override
  State<Patient_A1> createState() => _Patient_A1State();
}

class _Patient_A1State extends State<Patient_A1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //     child: ListView(children: [
      //   Text(
      //     'Navigator',
      //     style: TextStyle(fontSize: 30),
      //   ),
      //   RaisedButton(
      //       child: Text(
      //         'Home',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Home()),
      //         );
      //       }),
      //   RaisedButton(
      //       child: Text(
      //         'Room-1',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Room-A()),
      //         );
      //       }),
      //   RaisedButton(
      //     child: Text(
      //       'Room-2',
      //       style: TextStyle(fontSize: 30),
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Room2()),
      //       );
      //     },
      //   ),
      //   RaisedButton(
      //     child: Text(
      //       'Room-4',
      //       style: TextStyle(fontSize: 30),
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Room4()),
      //       );
      //     },
      //   ),
      // ])),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patient A-1', style: TextStyle(fontSize: 30)),
      ),
      body: ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              height: 150.0,
              child: RaisedButton(
                child: Text(
                  'Temperature',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => test()),
                  );
                },
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
              width: double.infinity,
              height: 150.0,
              child: RaisedButton(
                child: Text(
                  'Humidity',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => P1_sensor2()),
                  );
                },
              ),
            ))
      ]),
    );
  }
}
