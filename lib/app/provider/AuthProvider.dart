import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/LoginModel.dart';
import 'package:shoper/app/model/RegisterModel.dart';
import 'package:shoper/app/service/AuthService.dart';
import 'package:shoper/app/state/AuthSecureStorage.dart';
import 'package:shoper/app/state/AuthState.dart';
import 'package:shoper/app/state/LoadingState.dart';


// this is more provider
final authServiceProvider = Provider((ref){
  return AuthService();
});
final loadingProvider = Provider((ref){
  return LoadingState();
});
// this is auth provider
class AuthProvider extends Notifier<AuthState>{


  late final AuthService authService;
   late final AuthSecureStorage authSecureStorage;


  @override
  AuthState build() {
   authService = ref.read(authServiceProvider);
   authSecureStorage = AuthSecureStorage();
   return AuthState();
  }

 // auth register method
Future<void> register(RegisterModel registerModel)async{
    try{
      final res = await authService.userRegisterService(registerModel);
      state = state.copyWith(success: res['success'],error: '',message: res['message']);
    }catch(e){
       state = state.copyWith(success: false,error: e.toString());
    }
}

// login provider
Future<void> login(LoginModel loginModel)async{
   try{
     final res = await authService.login(loginModel);
     await authSecureStorage.saveToken(res["data"]['token']);
      state =state.copyWith(success: res["success"],message: res["message"]);
   }catch(e){
     state = state.copyWith(success:false,message: e.toString());
   }
}

// logout provider in this file



}

// notifier provider
final authNotifierProvider = NotifierProvider<AuthProvider, AuthState>(AuthProvider.new);

