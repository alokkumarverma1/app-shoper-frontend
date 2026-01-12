import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/RegisterModel.dart';
import 'package:shoper/app/service/AuthService.dart';
import 'package:shoper/app/state/AuthState.dart';


// this is more provider
final authServiceProvider = Provider((ref){
  return AuthService();
});

// this is auth provider
class AuthProvider extends Notifier<AuthState>{
  late final AuthService authService;
  @override
  AuthState build() {
   authService = ref.read(authServiceProvider);
   return AuthState();
  }

 // auth register method
Future<void> register(RegisterModel registerModel)async{
    state = state.copyWith(loading: true);
    try{
      final res = await authService.userRegisterService(registerModel);
      state = state.copyWith(loading: false,success: res['success'],error: '',message: res['message']);
    }catch(e){
       state = state.copyWith(loading: false,success: false,error: e.toString());
    }
}



}

// notifier provider
final authNotifierProvider = NotifierProvider<AuthProvider, AuthState>(AuthProvider.new);

