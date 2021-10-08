import 'package:flutter/material.dart';
import 'package:maptest/quotes_api.dart';
import 'package:maptest/todoa_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map Test',
      home: const JsonApi(),
    );
  }
}

class MapTest extends StatefulWidget {
  const MapTest({Key? key}) : super(key: key);

  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  List<Map<String,dynamic>> qutations=[
    {
      'quote': 'Adnan is Student',
      'Author': 'Adnan'
    },
    {
      'quote': 'farhan is Student',
      'Author': 'farhan'
    },
    {
      'quote': 'ahmad is Student',
      'Author': 'ahmad'
    },
    {
      'quote': 'ali is Student',
      'Author': 'ali'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: qutations.length,
        itemBuilder: (BuildContext context, int index) {
          return   Card(
            child: ListTile(
              title:  Text(qutations[index]['quote']),
              subtitle:  Text(qutations[index]['Author']),
            ),
          );
        },
      ),
    );
  }
}
