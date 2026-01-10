import 'package:flutter/material.dart';
import 'package:shoper/app/service/AuthService.dart';
import 'package:shoper/core/model/RegisterModel.dart';

class AuthController {


Future<bool> registerController(RegisterModel registerModel)async{
  final res =await AuthService().userRegisterService(registerModel);
    print(res);
    print(res);
  return true;
}


}