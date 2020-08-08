import '../../dashboard/dashEnd/onWidget.dart';
import '../../dashboard/feature.dart';
import '../../dashboard/widget.dart';
import '../../model.dart';
import '../../validation/validation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController title = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  List<bool> checkValues = new List();
  GetString parts = GetString();
  DateOnly gets = DateOnly();
  List deleteList = new List();
  List<String> id = new List();
  List<int> ints = new List();
  CRUD crud = new CRUD();
  String tanggal;
  int j = 0;
  List<Map<String, dynamic>> dinamen = new List<Map<String, dynamic>>();
  NewAddDialogT p = NewAddDialogT();
  List<Function> changasBool = List<Function>();
  @override
  void initState() {
    crud.getThems(dinamen, checkValues, () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Column(
              children: dinamen.map((f) {
            return UserWidgetsOld(
              checkBox: ChecksBoxs(checkValues,
                  dinamen.indexOf(f), ints),
              title: f["name"],
              desscription: f["description"],
              date: f["date"],
              id: f["ID"],
            );
          }).toList()),
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                p.incrementCounter(context, dinamen, checkValues, parts, gets,
                    () {
                  AddDescrip add = AddDescrip(
                    date: gets.str_dates,
                    name: parts.str_username,
                    description: parts.str_name,
                  );
                  crud.addData(add).then((f) {
                    setState(() {
                      gets.str_id_date = f;
                      add = AddDescrip(
                        id: gets.str_id_date.toString(),
                        date: gets.str_dates,
                        name: parts.str_username,
                        description: parts.str_name,
                      );
                      checkValues.add(false);
                      dinamen.add(add.toJson());
                    });
                  });
                });
              },
              child: Text("add"),
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          ints.forEach((f) {
            setState(() {
              checkValues[f] = false;
            });
          });
          List<String> yangDihapus = ints.map((f) {
            String dual = dinamen[f]["ID"];
            print(dual);
            return dual;
          }).toList();
          deleteDetector(context, yangDihapus, () {
            setState(() {
              ints.forEach((f) {
                dinamen.removeAt(f);
                checkValues.removeAt(f);
              });
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.remove_circle),
      ),
    );
  }
}
