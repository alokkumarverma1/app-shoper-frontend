
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shoper/app/model/LoginModel.dart';
import '../model/RegisterModel.dart';


class AuthService {
  final baseUrl = 'http://localhost:8080';

  // register service method
  Future<Map<String,dynamic>> userRegisterService(RegisterModel registerModel)async{
    final res =await http.post(
        Uri.parse("$baseUrl/userRegister"),
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

  // login service
 Future<Map<String,dynamic>> login(LoginModel loginModel)async{
     try{
       final res = await http.post(
         Uri.parse('$baseUrl/userLogin'),
         headers: {"Content-Type" : "application/json"},
         body: jsonEncode(loginModel.getJson()),
       );
       final data = jsonDecode(res.body);
       if(res.statusCode == 200){
         return{
           "success": true,
           "token" :data["token"],
           'message': data['message'] ?? "login success",
           'data' : data,
         };
       }else{
         return{
           "success": false,
           'message': data['message'] ?? "login failed",
           'data' : data,
         };
       }
     }catch(e){
       return{
         "success": false,
         "message" : "Something went wrong",
       };
     }
 }
 
 // logout service in service


}