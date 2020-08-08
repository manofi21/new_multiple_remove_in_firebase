import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserWidgetsOld extends StatelessWidget {
  final String title, desscription, date, id;
  Widget checkBox;
  UserWidgetsOld(
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
          subSubtitle(EdgeInsets.only(top: 5), this.date, 16, Colors.black),
          subSubtitle(
              EdgeInsets.only(top: 5), this.id.toString(), 16, Colors.black),
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
