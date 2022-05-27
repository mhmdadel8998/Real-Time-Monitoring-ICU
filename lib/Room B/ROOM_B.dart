import 'package:flutter/material.dart';
import 'package:icu_app/Room A/ROOM_A.dart';

import 'package:icu_app/Room A/Patient_A1.dart';
import 'package:icu_app/Room A/Patient_A2.dart';
import 'package:icu_app/main.dart';

class Room_B extends StatefulWidget {
  const Room_B({Key? key}) : super(key: key);

  @override
  State<Room_B> createState() => _Room_BState();
}

class _Room_BState extends State<Room_B> {
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
        title: Text('Room B', style: TextStyle(fontSize: 30)),
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
                  'Patient 2',
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
