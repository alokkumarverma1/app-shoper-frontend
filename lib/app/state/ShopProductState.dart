import 'package:flutter/material.dart';
import 'package:shoper/app/model/AddProductModel.dart';

class ShopProductState {
  final String message; // all message
  final bool success;    // add product success
  final bool? loading;  // loading
  final AddProductModel? addProductModel; // add product model
  final List<AddProductModel>? allMyShopProduct; // all my shop product store modle
  final bool productFind;  // you have product or not
  final bool deleteProduct; // product delete success or not

  ShopProductState({this.message='',this.success = false,this.loading,this.addProductModel,this.productFind = false,this.allMyShopProduct,this.deleteProduct = false});

  ShopProductState copyWith({String? message,bool? success,AddProductModel? addProductModel,bool? productFind,List<AddProductModel>? allMyShopProduct,bool? deleteProduct}){
   return ShopProductState(
     message: message ?? this.message,
     success: success ?? this.success,
     addProductModel:addProductModel ?? this.addProductModel,
     productFind: productFind ?? this.productFind,
     allMyShopProduct: allMyShopProduct ?? this.allMyShopProduct,
      deleteProduct: deleteProduct ?? this.deleteProduct,
   );
  }


}