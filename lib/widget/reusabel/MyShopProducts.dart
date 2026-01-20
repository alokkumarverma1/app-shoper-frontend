import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/provider/UserShopProductProvider.dart';
import 'package:shoper/app/state/UserShopProductState.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:shoper/widget/extra/Popup.dart';



class MyShopProducts extends ConsumerStatefulWidget{
  final AddProductModel product;
  const MyShopProducts({super.key,required this.product});

  @override
  ConsumerState<MyShopProducts> createState() => _MyShopProductsState();
}

class _MyShopProductsState extends ConsumerState<MyShopProducts> {

  double? textCount;


  @override
  Widget build(BuildContext context) {
    final changeWidth = MediaQuery.of(context).size.width;
    Uint8List imageBytes = base64Decode(widget.product.productImage);
    if(changeWidth <= 350){
      textCount = 120;
    }else if(changeWidth <= 700){
      textCount = 200;
    }else{
      textCount = 500;
    }
    ref.listen<ShopProductState>(addProductNotifier, (previous,next){
      if(next.deleteProduct == true){
        showDialog(context: context, builder:(_)=> Popup(title: next.message, icon: Icons.check));
      }
    });
    return Container(
      height: 100,
      width: ResponciveDesign(context).searchFieldWidht(),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: (){
            context.pushNamed("myShopProductFullDetails",extra: widget.product);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // image of shop product
              Container(
                width: 80,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Image.memory(imageBytes,height: 70,width: 100,fit: BoxFit.cover,),
                ),
              ),

              // product details
              SizedBox(width: 10,),
              Container(
                width:textCount,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                    Text(widget.product.details,overflow: TextOverflow.ellipsis),
                    SizedBox(height: 3,),
                    Row(
                      spacing: 10,
                      children: [
                        Text("₹${widget.product.price.toString()}"),
                        Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green.shade200
                            ),
                            child: Center(
                              child: Text("${widget.product.discount.toString()} %OFF"),
                            )
                        )
                      ],
                    )

                  ],
                ),
              ),

              Spacer(),
              // delete icon of procts
              IconButton(onPressed: ()async{
               await ref.read(addProductNotifier.notifier).deleteShopProduct(widget.product.id);
              await ref.read(addProductNotifier.notifier).getAllMyShopProduct();
               },
                  icon: Icon(Icons.delete)
              ),





            ],
          ),
        ),
      ),
    );
  }
}





