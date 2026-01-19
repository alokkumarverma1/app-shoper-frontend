import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shoper/app/state/AuthSecureStorage.dart';


class Userservice {

  final baseUrl = 'http://localhost:8080';


  // user profile service
  Future<Map<String,dynamic>> userDetails()async{
    final token =await AuthSecureStorage().getToken();
  try{
    final res = await http.get(Uri.parse("$baseUrl/userDetails"),
        headers: {"Authorization" : "Bearer $token"}
    );
    final data = jsonDecode(res.body);
    if(res.statusCode == 200){
      return{
        "message" : "user find success",
        "user":data
      };
    }else{
      return{
        "message" : data["message"],
      };
    }
  }catch(e){
    return{
      "message" : "Something went wrong",
    };
  }

  }







}