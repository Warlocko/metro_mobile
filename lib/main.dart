import 'package:flutter/material.dart';

import 'navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metro Mobile',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MmNavbarStateful(),
    );
  }
}