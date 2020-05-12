import 'package:flutter/material.dart';

import 'homepage.dart';
import 'store.dart';

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
      home: MmStoreStateful(),
    );
  }
}