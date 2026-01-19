import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/service/ShopProductService.dart';
import 'package:shoper/app/state/ShopProductState.dart';

final shopProductService = Provider((ref) {
  return ShopProductService();
});

class ShopProductProvider extends Notifier<ShopProductState> {
  late final ShopProductService shopProductServices;

  @override
  ShopProductState build() {
    shopProductServices = ref.read(shopProductService);
    Future.microtask(() => getAllMyShopProduct());
    return ShopProductState();
  }

  // Add product method
  Future<void> addProduct(AddProductModel addProductModel) async {
    final res = await shopProductServices.addProduct(addProductModel);
    if (res["message"] == "product add success") {
      state = state.copyWith(message: "Product add success", success: true);
      await getAllMyShopProduct();
    } else {
      state = state.copyWith(message: "Product add failed", success: false);
    }
  }

  Future<void> getAllMyShopProduct() async {
    try {
      final res = await shopProductServices.getAllShopProduct();
           if (res["message"] == "products find success") {
        final List<AddProductModel> products = (res["data"] as List)
            .map((item) => AddProductModel.fromJson(item))
            .toList();
        state = state.copyWith(
          allMyShopProduct: products,
          productFind: products.isNotEmpty,
        );
      } else {
        state = state.copyWith(
          allMyShopProduct: [],
          productFind: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        allMyShopProduct: [],
        productFind: false,
      );
    }
  }

// Delete product method (implement later)
Future<void> deleteShopProduct(int id)async{
    state = state.copyWith(deleteProduct: false);
    final res = await shopProductServices.deleteProduct(id);
    if(res["response"] == "delete success"){
      state = state.copyWith(message: "product delete success",deleteProduct: true);
    }else{
      state = state.copyWith(message: res["message"],deleteProduct: true);
    }
    state = state.copyWith(deleteProduct: false);
}
// Update product method (implement later)




}

// State provider
final addProductNotifier = NotifierProvider<ShopProductProvider, ShopProductState>(
  ShopProductProvider.new,
);
