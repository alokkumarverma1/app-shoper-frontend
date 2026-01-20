import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/state/AuthSecureStorage.dart';

class ShopService {

  final baseUrl = 'http://localhost:8080';

  // get shop details

  Future<Map<String,dynamic>> getShop()async{
    try{
      final token = await AuthSecureStorage().getToken();
      final res = await http.get(
        Uri.parse("$baseUrl/myShop"),
        headers:{"Authorization" : "Bearer $token"},
      );
      final data = jsonDecode(res.body);
      if(res.statusCode == 200){
        return {
          "data" : data,
          "message":"shop find success",
        };
      }else{
        return {
          "message":data["message"],
        };
      }
    }catch(e){
      return {
        "message":e.toString(),
      };
    }
  }

  // create shop details
Future<Map<String,dynamic>> createShop(ShopModel shopModel)async{
  try{
    final token = await AuthSecureStorage().getToken();
    final res = await http.post(Uri.parse("$baseUrl/createShop"),
      headers: {
        "Authorization" : "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(shopModel.getJson()),
    );
    final data = jsonDecode(res.body);
    if(res.statusCode == 200){
      return{
        "data" : true,
        "message" :  data,
      };
    }else{
      return{
        "message" : data,
      };
    }
  }catch(e){
    return{
      "message" : e.toString(),
    };
  }

}

// get all product of your shop




}