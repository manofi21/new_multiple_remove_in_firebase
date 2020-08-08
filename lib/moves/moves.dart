import 'package:flutter/material.dart';

class Moves {
  void sends(BuildContext context, dynamic d) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => d,
        ));
  }

  void sendsSaver(BuildContext context, dynamic d) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => d,
        ));
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
