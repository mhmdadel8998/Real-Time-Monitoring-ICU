import 'package:flutter/material.dart';
import 'package:icu_app/Room B/ROOM_B.dart';
import 'package:icu_app/Room A/Patient_A1.dart';
import 'package:icu_app/Room A/Patient_A2.dart';
import 'package:icu_app/main.dart';
import 'package:icu_app/Room A/PA1_sensor1.dart';
import 'package:icu_app/saleshomepage.dart';
import 'package:icu_app/main.dart';
import 'package:icu_app/Room A/PA1-sensor2.dart';

class Room_A extends StatefulWidget {
  const Room_A({Key? key}) : super(key: key);

  @override
  State<Room_A> createState() => _Room1State();
}

class _Room1State extends State<Room_A> {
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
      //         'Room-2',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Room2()),
      //         );
      //       }),
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
        title: Text('Room A', style: TextStyle(fontSize: 30)),
      ),
      body: ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              height: 150.0,
              child: RaisedButton(
                child: Text(
                  'Patient 1',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Patient_A1()),
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
                  'Patient 2',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Patient_A2()),
                  );
                },
              ),
            ))
      ]),
    );
  }
}
