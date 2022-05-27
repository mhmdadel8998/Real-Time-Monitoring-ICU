import 'package:flutter/material.dart';
import 'package:icu_app/Room A/ROOM_A.dart';
import 'package:icu_app/Room B/ROOM_B.dart';
import 'package:icu_app/Room A/Patient_A1.dart';
import 'package:icu_app/main.dart';

class Patient_A2 extends StatefulWidget {
  const Patient_A2({Key? key}) : super(key: key);

  @override
  State<Patient_A2> createState() => _Patient_A2State();
}

class _Patient_A2State extends State<Patient_A2> {
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
      //           MaterialPageRoute(builder: (context) => Room1()),
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
      //       'Room-3',
      //       style: TextStyle(fontSize: 30),
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Room3()),
      //       );
      //     },
      //   ),
      // ])),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patient A-2', style: TextStyle(fontSize: 30)),
      ),
      body: ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              height: 150.0,
              child: RaisedButton(
                child: Text(
                  'Sensor 1',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.green,
                onPressed: () {},
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
              width: double.infinity,
              height: 150.0,
              child: RaisedButton(
                child: Text(
                  'sensor 2',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.red,
                onPressed: () {},
              ),
            ))
      ]),
    );
  }
}
