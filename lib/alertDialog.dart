import 'package:flutter/material.dart';
import 'moves/moves.dart';

class AlertsDialog{
    void waitingDialog(BuildContext context, bool check, dynamic d) {
    if (check == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Waiting Dialog"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Please Wait a Moment")
              ],
            ),
          );
        },
      );
    } else {
      Moves().sendsSaver(context, d);
    }
  }


  void waitingDialogBack(BuildContext context, bool check) {
    if (check == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Waiting Dialog"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Please Wait a Moment")
              ],
            ),
          );
        },
      );
    } else {
      Moves().back(context);
    }
  }

  loadingPage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Waiting Dialog"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Please Wait a Moment")
            ],
          ),
        );
      },
    );
  }

  Widget waiting() {
    return AlertDialog(
      title: new Text("Waiting Dialog"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CircularProgressIndicator(),
          Text("Please Wait a Moment")
        ],
      ),
    );
  }
}
