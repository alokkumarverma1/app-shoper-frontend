import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:shoper/core/thems/MyColors.dart';
import 'package:shoper/widget/reusabel/PruductReview.dart';

class MyShopProductDetails extends StatelessWidget {
  final AddProductModel addProductModel;
  int? imageHeight;

   MyShopProductDetails({super.key, required this.addProductModel});
 
  
  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(addProductModel.productImage);
    double screenWidth = MediaQuery.of(context).size.width;
    if(screenWidth <= 400){
      imageHeight =250;
    }else if(screenWidth <= 800){
      imageHeight =450;
    }else{
      imageHeight= 500;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Container(
                  height: double.parse(imageHeight.toString()),
                  width: ResponciveDesign(context).searchFieldWidht(),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                addProductModel.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  if (addProductModel.category.isNotEmpty)
                    Chip(
                      label: Text(addProductModel.category),
                      backgroundColor: Colors.white,
                    ),
                  SizedBox(width: 10),
                  if (addProductModel.brand.isNotEmpty)
                    Chip(
                      label: Text(addProductModel.brand),
                      backgroundColor: Colors.white,
                    ),
                ],
              ),

              SizedBox(height: 15),
              Text(
                addProductModel.details,
                style: TextStyle(fontSize: 16, color: Colors.grey[800], height: 1.4),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "₹${addProductModel.price}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(width: 10),
                  if (addProductModel.discount > 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "${addProductModel.discount}% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                "Only  ₹${addProductModel.price - addProductModel.price/10}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),

              Text(
                addProductModel.productCount > 0
                    ? "In Stock: ${addProductModel.productCount}"
                    : "Out of Stock",
                style: TextStyle(
                  fontSize: 16,
                  color: addProductModel.productCount > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

          // add in cart and bay button
              SizedBox(height: 20,),
          Container(
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(onPressed: (){},icon: Icon(Icons.shopping_cart,color: Mycolors.buttons,),style: ElevatedButton.styleFrom(backgroundColor: Colors.white), label: Text("Add cart",style: TextStyle(color: Colors.black),)),
                ElevatedButton.icon(onPressed: (){},icon: Icon(Icons.shopping_cart_checkout,color: Mycolors.buttons,),style: ElevatedButton.styleFrom(backgroundColor: Colors.white), label: Text("Bay",style: TextStyle(color: Colors.black),)),
              ],
            ),
          ),

               _middleText("All Reviews"),
               SizedBox(
                 height: 200,
                 child: GridView.builder(
                   shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                       maxCrossAxisExtent: 400,
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 10,
                   ),
                   itemCount: 20,
                   itemBuilder: (BuildContext context, int index) {
                     return ProductReview();
                   },
                 ),
               ),
              // add review
              SizedBox(height: 100,width: double.infinity,),
               _middleText("Add Review"),
              Container(
                width: double.infinity,
               child: Form(
                   child: Column(
                     children: [
                       Container(
                         width: ResponciveDesign(context).searchFieldWidht(),
                         decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black.withOpacity(0.2),
                               blurRadius: 8,
                               offset: Offset(0, 4),
                             ),
                           ],
                         ),
                         child: TextFormField(
                           maxLines: 3,
                           decoration: InputDecoration(
                             hintText: "Add review",
                             prefixIcon: Icon(Icons.add),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                               borderSide: BorderSide.none,
                             ),
                             filled: true,
                             fillColor: Colors.white,
                           ),
                         ),
                       ),

                       SizedBox(height: 30,),
                       ElevatedButton.icon(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.white),label: Text("Add",style: TextStyle(color: Colors.black),),)
                     ],
                   )
               ),
              ),

              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  // top heading
Widget _middleText(String heading){
    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(heading,style: TextStyle(fontWeight: FontWeight.w600),),
      ),
    );
}

}
