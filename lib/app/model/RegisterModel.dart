import 'package:flutter/material.dart';


class RegisterModel {
  String name;
  int number;
  String mail;
  String location;
  String password;

  RegisterModel({
    required this.name,
    required this.number,
    required this.mail,
    required this.location,
    required this.password,
});

  Map<String ,dynamic> getJson(){
    return {
      "name": name,
      "number": number,
      "mail": mail,
      "location": location,
      "password": password,
    };
  }





}