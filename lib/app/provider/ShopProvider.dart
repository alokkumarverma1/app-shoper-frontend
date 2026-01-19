import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/service/ShopService.dart';
import 'package:shoper/app/state/ShopState.dart';
import 'package:shoper/screens/setting/myShop/MyShop.dart';


final shopServiceProvider = Provider((ref){
  return ShopService();
});


class ShopProvider extends Notifier<ShopState>{
   late final ShopService shopService;

  @override
  ShopState build() {
    shopService = ref.read(shopServiceProvider);
    return ShopState();
  }

  // get shop details
Future<void> getShop()async{
     final res = await shopService.getShop();
     if(res["message"] == "shop find success"){
       final data = res["data"];
       ShopModel shopModel = ShopModel(shopName: data["shopName"], number:data["number"], mail: data["email"], location: data["location"]);
       state = state.copyWith(myShop: true,shopModel: shopModel);
     }else{
       state = state.copyWith(myShop: false);
     }
}

// get create details
Future<void> createShop(ShopModel shopModel)async{
    final res = await shopService.createShop(shopModel);
    state = state.copyWith(message: res["message"],myShop: res["data"]);
    }



}

final shopNotifierProvider = NotifierProvider<ShopProvider,ShopState>(ShopProvider.new);