import 'package:flutter/material.dart';
import 'dashboard/dashEnd/dashEnd.dart';
import 'dashboard/dashEnd/testert.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // plush add feature
  MyHomePage d = new MyHomePage(title: "title",);
  // Test d = new Test();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: d
      )
    );
  }
}