
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/UserModel.dart';
import 'package:shoper/app/service/UserService.dart';
import 'package:shoper/app/state/UserState.dart';

final userServiceProvider = Provider((ref){
  return UserState();
});


class UserProvider extends Notifier<UserState>{

  late final Userservice userService;
  @override
  UserState build() {
    return UserState();
  }

  // user profile data
Future<void> userDetails()async{
 try{
   final res = await userService.userDetails();
   final UserModel userModel = UserModel(name: res["name"], number: res["number"], mail:res["mail"], location: res["location"]);
   state = state.copyWith(userModel:userModel);
 }catch(e){
   state = state.copyWith(message:e.toString());
 }
}

final userProvider = NotifierProvider<UserProvider,UserState>(UserProvider.new);



}