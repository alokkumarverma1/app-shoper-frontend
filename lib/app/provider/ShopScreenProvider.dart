import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/service/ShopScreenService.dart';
import 'package:shoper/app/state/ShopScreenState.dart';


final shopScreenService = Provider((ref){
return ShopScreenService();
});


class ShopScreenProvider extends Notifier<ShopScreenState> {
 late final ShopScreenService service;

  @override
  build() {
    service = ref.read(shopScreenService);
    Future.microtask(()=> getAllShop());
    return ShopScreenState();
  }

// get all shop on shop screen
Future<void> getAllShop()async{
    state = state.copyWith(loading: true);
    final res = await service.getAllShop();
   List<ShopModel> shopModel = (res["data"] as List).map((item)=> ShopModel.fromJson(item)).toList();
    if(res["message"] == "all shop find success"){
      state = state.copyWith(loading: false,shopModel: shopModel,message: "shop find success");
    }
}
// get shop product by shop id
Future<void> getAllProduct(int id)async{
    final res = await service.gettAllProduct(id);
    if(res["message"] == "product find success"){
      List<AddProductModel> productModel = (res["data"] as List).map((item) => AddProductModel.fromJson(item)).toList();
      state = state.copyWith(addProductModel: productModel);
    }else{
      state = state.copyWith(message: "add product failed");
    }
}

// other things


}

final shopScreenNotifierProvider = NotifierProvider<ShopScreenProvider,ShopScreenState>(ShopScreenProvider.new);