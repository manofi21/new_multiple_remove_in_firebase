import 'package:cloud_firestore/cloud_firestore.dart';
import '../model.dart';
import '../validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CRUD {
  CollectionReference collec = Firestore.instance.collection('todo-list');

  Future<void> deleteData(id) async {
    await collec.document(id).delete().catchError((e) {
      print(e);
    });
  }

  Future<List<Map<String, dynamic>>> querySnaps() async {
    return await collec.getDocuments().then((documents) {
      return documents.documents.map((DocumentSnapshot doc) {
        return doc.data;
      }).toList();
    });
  }

  Future<List<String>> documentsData() async {
    return await collec.getDocuments().then((document) {
      return document.documents.map((DocumentSnapshot doc) {
        return doc.documentID;
      }).toList();
    });
  }

  Future<String> documentsLastData() async{
    return await collec.getDocuments().then((document) {
      List<String> documentIni = document.documents.map((DocumentSnapshot doc) {
        return doc.documentID;
      }).toList();
      return documentIni.last;
    });
  }

  Future<String> addData(AddDescrip add) async{
    return await collec.add(add.toJson()).then((f){
      return f.documentID; 
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> addData2(Map<String,dynamic> add) async{
    await collec.add(add).catchError((e) {
      print(e);
    });
  }

    Future<DateTime> getDateTimes(BuildContext context,DateOnly gets,{void onSa()}) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    ).then((DateTime value) {
      if(value != null){
        gets.str_dates = DateFormat("dd-MM-yyyy").format(value);
      }
      onSa();
    });
  }

  void getThems(List<Map<String, dynamic>> dinamen,List<bool> checkValues,void voids()) async {
    List<String> id = await documentsData();
    List<Map<String, dynamic>> list = await querySnaps();
    list.forEach((f) {
      voids();
      Map<String, dynamic> map = new Map();
      map["ID"] = id[list.indexOf(f)];
      map["date"] = f["date"];
      map["name"] = f["name"];
      map["description"] = f["description"];
      dinamen.add(map);
    });
    for (int i = 0; i < list.length; i++) {
      checkValues.add(false);
    }
    print(dinamen.length);
  }
}
