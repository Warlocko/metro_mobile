import 'package:flutter/material.dart';
import 'package:metromobile/UserM.dart';
import 'package:metromobile/auth.dart';
import 'package:metromobile/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserM>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Metro Mobile',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Wrapper(),
      ),
    );
  }
}