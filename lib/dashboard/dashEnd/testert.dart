import '../../validation/validation.dart';
import 'package:flutter/material.dart';
import '../../model.dart';
import '../widget.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Test d = new Test();
  DateOnly gets = new DateOnly();
  static GetString parts = new GetString();
  NewAddDialogT p = NewAddDialogT();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: (){
          // p.incrementCounter(context);
      }),      
    );
  }
}