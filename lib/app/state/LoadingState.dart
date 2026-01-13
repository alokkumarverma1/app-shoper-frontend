import 'package:shoper/app/state/AuthState.dart';

class LoadingState {
  final bool loading;

 LoadingState({this.loading = false});

 LoadingState copyWith({bool? loading}){
   return LoadingState(
     loading: loading ?? this.loading
   );
 }






}