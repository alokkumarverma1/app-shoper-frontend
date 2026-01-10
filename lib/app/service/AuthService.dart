import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoper/core/model/RegisterModel.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final baseUrl = 'http://localhost:8080';

  Future<bool> userRegisterService(RegisterModel registerModel)async{
    final res =await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type":"application/json"},
        body:jsonEncode(registerModel.getJson())
    );
    print(res);
    if(res.statusCode == 200){
      return true;
    }
   return false;
  }


}