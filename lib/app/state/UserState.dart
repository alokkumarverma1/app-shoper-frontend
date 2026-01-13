import 'package:shoper/app/model/UserModel.dart';


class UserState {
  final String message;
  final UserModel? userModel;

  UserState({this.userModel,this.message = ""});

  UserState copyWith({UserModel? userModel,String? message}){
    return UserState(userModel: userModel ?? this.userModel,
                     message: message ?? this.message);
}

}