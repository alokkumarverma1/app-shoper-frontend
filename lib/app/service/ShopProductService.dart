import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoper/app/state/AuthSecureStorage.dart';
import '../model/AddProductModel.dart';

class ShopProductService {

  final baseUrl = 'http://localhost:8080';



  // add product service method
  Future<Map<String,dynamic>> addProduct(AddProductModel addProductModel)async{
    try{
      final token =await AuthSecureStorage().getToken();
      final res = await http.post(Uri.parse("$baseUrl/addProduct"),
          headers: {
            "Content-Type": "application/json",
            "Authorization" : "Bearer $token"
          },
          body:jsonEncode(addProductModel.getJson())
      );
      final data = jsonDecode(res.body);
      if(res.statusCode == 200){
        return{
          "message":"product add success",
          "data" : data["message"]
        };
      }else{
        return{
          "message":"product add failed",
          "data" :data["message"],
        };
      }
    }catch(e){
      return{
        "message":"something went wrong",
      };
    }
  }

 // get my all product
Future<Map<String,dynamic>> getAllShopProduct()async{
  try{
    final token = await AuthSecureStorage().getToken();
    final res = await http.get(Uri.parse("$baseUrl/getAllShopProduct"),
        headers: {"Authorization" : "Bearer $token"}
    );
    final data= jsonDecode(res.body);
    if(res.statusCode == 200){
      return{
        "message" : "products find success",
        "data" :data["data"],
      };
    }else{
      return{
        "message" : "something wrong",
      };
    }
  }catch(e){
    return{
      "message" : e.toString()
    };
  }
}

// delete product service method
Future<Map<String,dynamic>> deleteProduct(int id)async{
   try{
     final toekn = await AuthSecureStorage().getToken();
     final res =await http.post(Uri.parse("$baseUrl/deleteMyShopProduct/$id"),
         headers: {"Authorization" : "Bearer $toekn",
           "Content-Type" : "application/json"}
     );
     final data = jsonDecode(res.body);
     if(res.statusCode == 200){
       print(data["message"]);
       return{
         "response" : "delete success",
         "message":data["message"],
       };
     }else{
       return{
         "message":"someThing went wrong",
       };
     }
   }catch(e){
     return{
       "message":e.toString(),
     };
   }

}

// update product service method


}