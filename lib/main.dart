import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:icu_app/Room A/ROOM_A.dart';
import 'package:icu_app/Room B/ROOM_B.dart';
import 'package:icu_app/Room A/Patient_A1.dart';
import 'package:icu_app/Room A/Patient_A2.dart';

final List<double> yvalue = [];
final List<double> yvalue1 = [0, 0];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _database = FirebaseDatabase.instance.ref();
  _database.child('/test/temperature').onValue.listen((event) {
    final Object? description = event.snapshot.value;
    print(description);

    String OH = description.toString();
    yvalue.add(double.parse(OH));
  });
  final _database2 = FirebaseDatabase.instance.ref();
  _database2.child('/test/humidity').onValue.listen((event) {
    final Object? description2 = event.snapshot.value;
    print(description2);

    String OH = description2.toString();
    yvalue1.add(double.parse(OH));
  });
  runApp(Main_page());
}

class Main_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      //         'Room-A',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Room1()),
      //         );
      //       }),
      //   RaisedButton(
      //       child: Text(
      //         'Room-B',
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
        title: Text(
          'ICU_Monitoring',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              height: 100.0,
              child: RaisedButton(
                child: Text(
                  'Room A',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Room_A()),
                  );
                },
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
              width: double.infinity,
              height: 100.0,
              child: RaisedButton(
                child: Text(
                  'Room B',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Room_B()),
                  );
                },
              ),
            )),
      ]),
    );
  }
}
