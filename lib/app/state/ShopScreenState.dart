import 'package:flutter/material.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/model/ShopModel.dart';

 class ShopScreenState{
final bool? loading;
final String? message;
final List<ShopModel>? shopModel;
final List<AddProductModel>? addProductModel;

ShopScreenState({this.loading = true,this.message,this.shopModel,this.addProductModel});

ShopScreenState copyWith({bool? loading,String? message,List<ShopModel>? shopModel,List<AddProductModel>? addProductModel}){
  return ShopScreenState(
    loading: loading ?? this.loading,
    message: message ?? this.message,
    shopModel: shopModel ?? this.shopModel ?? [],
    addProductModel: addProductModel ?? this.addProductModel,
  );
}



 }