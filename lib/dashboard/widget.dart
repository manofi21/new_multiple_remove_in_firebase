import '../dashboard/feature.dart';
import '../validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model.dart';

Widget textRich(List<String> stringPack) {
  return RichText(
    text: TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
              text: stringPack[0],
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(
              text: '\n' + stringPack[1],
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: '\n' + stringPack[2],
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline))
        ]),
  );
}

deleteDetector(BuildContext context, List deleteList, void onVoids()) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Style', style: TextStyle(fontSize: 15.0)),
          content: Text('Delete data'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              textColor: Colors.blue,
              onPressed: () {
                onVoids();
                deleteList.forEach(
                    (value) => CRUD().deleteData(value).catchError((e) {
                          print(e);
                        }));
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

Widget textFormFieldAuth(
    String string, Function onSaved, FormFieldValidator<String> validator) {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: TextFormField(
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
          hintText: string,
          prefixIcon: Icon(Icons.message),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28))),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////
class ChecksBoxs extends StatefulWidget {
  ChecksBoxs(this.checks, this.i, this.ints);
  List<bool> checks;

  final int i;
  final List<int> ints;
  @override
  _ChecksBoxsState createState() =>
      _ChecksBoxsState(this.checks, this.i, this.ints);
}

class _ChecksBoxsState extends State<ChecksBoxs> {
  _ChecksBoxsState(this.checks, this.i, this.ints);
  List<bool> checks;
  final int i;
  final List<int> ints;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      // jika berurusan dengan onChanges dari luar (Contohnya chekcbox). 
      // langsung hapus saja
      onChanged: (bool value) {
        setState(() {
          checks[i] = value;
          if (value == true) {
            ints.add(i);
            value = false;
          } else {
            ints.remove(i);
          }
        });
      },
      value: checks[i],
    );
  }
}
/////////////////////////////////////////////////////////////////////////

Widget flatButton(String titles, {VoidCallback theVoid}) {
  return Container(
    margin: EdgeInsets.only(bottom: 14),
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(30.0)),
    child: FlatButton(
        onPressed: theVoid,
        child: Text(
          titles,
        )),
  );
}

//////
class UserWidget extends StatelessWidget {
  final String title, desscription, date, id;
  Widget checkBox;
  UserWidget(
      {Key key,
      this.title,
      this.desscription,
      this.date,
      this.checkBox,
      this.id});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 10, right: 5, left: 5),
      margin: new EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        title: subSubtitle(EdgeInsets.only(left: 10), this.title.toUpperCase(),
            17, Colors.blue),
        subtitle: dreat(checkBox, <Widget>[
          subSubtitle(EdgeInsets.only(top: 10), this.title, 18, Colors.black),
          subSubtitle(
              EdgeInsets.only(top: 5), this.desscription, 16, Colors.black),
          subSubtitle(EdgeInsets.only(top: 5), "kamar", 16, Colors.black),
          // subSubtitle(EdgeInsets.only(top: 5), this.id, 16, Colors.black),
        ]),
        onTap: () {},
      ),
    );
  }
}
/*
ChecksBoxs(checkValues[i],i,ints)
 */

Widget subSubtitle(EdgeInsets del, String tex, double font, Color due) {
  return Container(
    padding: del,
    child: Text(tex, style: TextStyle(color: due, fontSize: font)),
  );
}

Container dreat(Widget checkBox, List<Widget> chidren) {
  if (checkBox == null) checkBox = Container();
  return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          checkBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: chidren,
          )
        ],
      ));
}

class NewAddDialogT {
  void incrementCounter(BuildContext context, List<Map<String, dynamic>> list,
      List<bool> checks, GetString parts, DateOnly gets, VoidCallback voids) {
    GlobalKey<FormState> kfrema = new GlobalKey<FormState>();
    Validing valid = new Validing(parts);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
                key: kfrema,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    textFormFieldAuth(
                        "name", valid.saverName, valid.controllerName),
                    SizedBox(height: 5.0),
                    textFormFieldAuth("description", valid.saverUsername,
                        valid.controllerName),
                    SizedBox(height: 5.0),
                    DateButton(gets),
                    FlatButton(
                      textColor: Colors.blue,
                      onPressed: () {
                        kfrema.currentState.save();
                        Navigator.pop(context);
                      },
                      child: Text("Submit"),
                    )
                  ],
                )),
          );
        }).then((f) {
      voids();
    });
  }
}

class DateButton extends StatefulWidget {
  DateOnly gets;
  DateButton(this.gets);
  @override
  _DateButtonState createState() => _DateButtonState(this.gets);
}

class _DateButtonState extends State<DateButton> {
  DateOnly gets;
  _DateButtonState(this.gets);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2018),
          lastDate: DateTime(2025),
        ).then((DateTime value) {
          if (value != null) {
            setState(() {});
            gets.str_dates = DateFormat("dd-MM-yyyy").format(value);
          }
        });
      },
      child: Text("DateTime"),
    );
  }
}
