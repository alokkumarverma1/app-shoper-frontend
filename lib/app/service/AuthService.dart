
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../model/RegisterModel.dart';


class AuthService {
  final baseUrl = 'http://localhost:8080';
  final storage = FlutterSecureStorage();

  // user login or not function
    Future<bool> islogin()async{
    String? token =await storage.read(key: "userToken");
    bool res = token == null ? false : true;
    return res;
  }

  // register service method
  Future<Map<String,dynamic>> userRegisterService(RegisterModel registerModel)async{
    final res =await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type":"application/json"},
        body:jsonEncode(registerModel.getJson())
    );
    if(res.statusCode == 200){
      return {
        'success': true,
        'message': 'register success'
      };
    };

    final data = jsonDecode(res.body);
    return {
      'success' : false,
      'message': data['message'] ?? "registration failed"
    };


  }


}