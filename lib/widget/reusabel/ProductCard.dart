import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/model/AddProductModel.dart';

class ProductCard extends StatelessWidget {
  final AddProductModel addProductModel;
  const ProductCard({super.key,required this.addProductModel});

  @override
  Widget build(BuildContext context) {
    Uint8List image = base64Decode(addProductModel.productImage);
    final int mainPrice = addProductModel.price - (addProductModel.price/addProductModel.discount).toInt();
    return InkWell(
      onTap: (){context.pushNamed("myShopProductFullDetails",extra: addProductModel);},
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        height: 100,
        child: Column(
          children: [
            ClipRRect(
              child: Image.memory(image,height: 50,width: 100,),
            ),
            Text(addProductModel.name,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("₹ ${addProductModel.price}",style: TextStyle(
                decoration:TextDecoration.lineThrough
            ),),

            // discount
            Container(
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade200
                ),
                child: Center(
                  child: Text("${addProductModel.discount} %OFF"),
                )
            )
          ],),
            SizedBox(height: 10,),
            Text("Only $mainPrice",style: TextStyle(fontWeight: FontWeight.bold))


          ],
        ),
      ),
    );
  }
}
