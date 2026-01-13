import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSecureStorage {

  final FlutterSecureStorage secureToken = FlutterSecureStorage();

  // add token
  Future<void> saveToken(String token)async{
    await secureToken.write(key: 'token', value: token);
  }

  // read token
Future<String?> getToken()async{
   return  await secureToken.read(key: 'token');
}

// delet token
Future<void> deleteToken()async{
    await secureToken.delete(key: 'token');
}



}