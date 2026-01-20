import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShopScreenService{
  final baseUrl = 'http://localhost:8080';


  // get all shop of this application
Future<Map<String,dynamic>> getAllShop()async{
  try{
    final res = await http.get(Uri.parse("$baseUrl/getAllShop"),
        headers: {"Content-Type" : "application/json"}
    );
    final data = jsonDecode(res.body);
    if(res.statusCode == 200){
      return {"message" :"all shop find success", "data" : data["data"],};
    }else{
      return {"message" : data["message"],};
    }
  }catch(e){
    return {"message" :"something wrong",};
  }
  }

  // get shop products with shop id
Future<Map<String,dynamic>> gettAllProduct(int id)async{
try{
  final res =await http.post(Uri.parse("$baseUrl/getAllProduct/$id"),
      headers: {"Content-Type":"application/json"}
  );
  final data = jsonDecode(res.body);
  if(res.statusCode == 200){
    return{"message" : "product find success", "data" : data["data"],};
  }else{return{"message" : "product find failed"};}
}catch(e){return{"message" : "something went wrong",};
}
}

// get all shop





}