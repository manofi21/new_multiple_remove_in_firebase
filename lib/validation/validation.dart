import 'package:flutter/material.dart';
import '../model.dart';

class Validing{
  GetString parts;
  GlobalKey<FormState> kfomr;
  Validing(this.parts);

  String controllerName(String name){
    if(name.isEmpty){
      return 'Enter some text';
    }
    return null;
  }


  Function saverId(String auto) {
    parts.str_id = auto;
  } 

  Function saverName(String auto) {
    parts.str_name = auto;
  }

  Function saverTanggalLahir(String auto) {
    parts.str_tanggal_lahir = auto;
  }

  Function saverUsername(String auto) {
    parts.str_username = auto;
  }

  Function saverEmail(String auto) {
    parts.str_email = auto;
  }

  Function saverPassword(String auto) {
    parts.str_password = auto;
  }

}

class DateOnly{
  String dates;
  String id;

  String get str_id_date{
    return id;
  }

  void set str_id_date(String id){
    this.id = id;
  }  

  String get str_dates{
    return dates;
  }

  void set str_dates(String dates){
    this.dates = dates;
  }

}