import 'package:shoper/app/model/ShopModel.dart';

class ShopState {
  final ShopModel? shopModel;
  final bool myShop;
  final String? message;

  ShopState({this.shopModel, this.myShop = false,this.message});

  ShopState copyWith({ShopModel? shopModel,bool? myShop,String? message}) {
    return ShopState(
      shopModel: shopModel ?? this.shopModel,
      myShop: myShop ?? this.myShop,
      message: message ?? this.message,
    );
  }
}
