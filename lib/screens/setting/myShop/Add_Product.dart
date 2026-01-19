
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/provider/ShopProductProvider.dart';
import 'package:shoper/app/state/ShopProductState.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/widget/extra/Popup.dart';

import '../../../app/model/AddProductModel.dart';

class AddProduct extends ConsumerStatefulWidget{
  const AddProduct({super.key});

  @override
  ConsumerState<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends ConsumerState<AddProduct> {

  // image picker details
  Uint8List? image;
   String? error = "chose image";
   final picker = ImagePicker();
   // form details
  final key = GlobalKey<FormState>();
  final name = TextEditingController();
  final details = TextEditingController();
  final price = TextEditingController();
  final discount = TextEditingController();
  final itemCount = TextEditingController();
  String category = '';
  final brand = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<ShopProductState>(addProductNotifier, (previous , next){
     if(next.success == true){
       showDialog(context: context,
           builder: (_) => Popup(title: next.message, icon: Icons.light)
       );
       Future.delayed(Duration(seconds: 2),(){
         context.pop('/myShopItems');
       });
     }else{
       showDialog(context: context,
           builder: (_) => Popup(title: next.message, icon: Icons.light)
       );
       Future.delayed(Duration(seconds: 2),(){
         Navigator.of(context).pop();
         context.go('/myShopItems');
       });
     }
    });
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             
               SizedBox(width: double.infinity,),
             // form of add product
             Container(
               width: ResponciveDesign(context).searchFieldWidht(),
               padding: EdgeInsets.all(20),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.15),
                     blurRadius: 8,
                     spreadRadius: 1,
                     offset: Offset(0, 3),
                   ),
                 ],

               ),
               child: Form(
                 key: key,
                   child: Column(
                     spacing: 20,
                     children: [


                    GestureDetector(
                      onTap:()async{
                        final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
                       if(pickedImage != null){
                         final imagePath = await pickedImage.readAsBytes();
                         setState((){
                           image = imagePath;
                           error ='chose success';
                         });

                       }
                      } ,
                      child: Container(
                       height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: image != null ? Image.memory(image!,fit: BoxFit.cover) :Icon(Icons.add),
                      ),
                    ),
                    Text("$error"),
               // other details
                   TextFormField(
                     controller: name,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       hintText: "product name",
                       filled: true,
                       prefixIcon: Icon(Icons.person),
                       fillColor: const Color(0xFFF2F2F2),
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                     ),
                     validator: (value){
                       if(value == null || value.isEmpty) return "add product name ";
                     },
                   ),

                       TextFormField(
                         controller: details,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: "Product details",
                           filled: true,
                           prefixIcon: Icon(Icons.data_array),
                           fillColor: const Color(0xFFF2F2F2),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                         ),
                         validator: (value){
                           if(value == null || value.isEmpty) return "add product details ";
                         },
                       ),
                       TextFormField(
                         controller: price,
                         keyboardType: TextInputType.number,
                         decoration: InputDecoration(
                           hintText: "product price",
                           filled: true,
                           prefixIcon: Icon(Icons.currency_rupee),
                           fillColor: const Color(0xFFF2F2F2),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                         ),
                         validator: (value){
                           if(value == null || value.isEmpty) return "add product price ";
                         },
                       ),
                       TextFormField(
                         controller: discount,
                         keyboardType: TextInputType.number,
                         decoration: InputDecoration(
                           hintText: "%of in product",
                           filled: true,
                           prefixIcon: Icon(Icons.discount),
                           fillColor: const Color(0xFFF2F2F2),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                         ),
                         validator: (value){
                           if(value == null || value.isEmpty) return "add product discount ";
                         },
                       ),

                       TextFormField(
                         controller: itemCount,
                         keyboardType: TextInputType.number,
                         decoration: InputDecoration(
                           hintText: "total product count",
                           filled: true,
                           prefixIcon: Icon(Icons.list),
                           fillColor: const Color(0xFFF2F2F2),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                         ),
                         validator: (value){
                           if(value == null || value.isEmpty) return "add product count ";
                         },
                       ),

                       // product category
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: "select category",
                          filled: true,
                          prefixIcon: Icon(Icons.category),
                          fillColor: const Color(0xFFF2F2F2),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                        ),
                        items: [
                          // Electronics
                          DropdownMenuItem(value: "mobile_phones", child: Text("Mobile Phones")),
                          DropdownMenuItem(value: "laptops", child: Text("Laptops")),
                          DropdownMenuItem(value: "cameras", child: Text("Cameras")),
                          DropdownMenuItem(value: "headphones", child: Text("Headphones")),
                          // Fashion
                          DropdownMenuItem(value: "mens_clothing", child: Text("Men's Clothing")),
                          DropdownMenuItem(value: "shoes", child: Text("Shoes & Footwear")),
                          DropdownMenuItem(value: "bags", child: Text("Bags & Accessories")),
                          DropdownMenuItem(value: "jewelry", child: Text("Watches & Jewelry")),

                          // Home & Living
                          DropdownMenuItem(value: "furniture", child: Text("Furniture")),
                          DropdownMenuItem(value: "kitchen", child: Text("Kitchen & Dining")),
                          DropdownMenuItem(value: "home_decor", child: Text("Home Decor")),
                          DropdownMenuItem(value: "bedding", child: Text("Bedding & Bath")),
                          DropdownMenuItem(value: "lighting", child: Text("Lighting")),

                          // Beauty & Personal Care
                          DropdownMenuItem(value: "skincare", child: Text("Skincare")),
                          DropdownMenuItem(value: "haircare", child: Text("Haircare")),
                          DropdownMenuItem(value: "makeup", child: Text("Makeup")),
                          DropdownMenuItem(value: "fragrance", child: Text("Fragrances")),
                          DropdownMenuItem(value: "grooming", child: Text("Personal Grooming")),

                          // Sports & Outdoors
                          DropdownMenuItem(value: "fitness", child: Text("Fitness Equipment")),
                          DropdownMenuItem(value: "sportswear", child: Text("Sportswear")),

                          DropdownMenuItem(value: "baby_clothing", child: Text("Baby Clothing")),
                          DropdownMenuItem(value: "toys", child: Text("Toys & Games")),
                          // Books & Stationery
                          DropdownMenuItem(value: "books", child: Text("Books")),

                          DropdownMenuItem(value: "packaged_food", child: Text("Packaged Foods")),
                          DropdownMenuItem(value: "beverages", child: Text("Beverages")),
                          DropdownMenuItem(value: "snacks", child: Text("Snacks & Confectionery")),
                          DropdownMenuItem(value: "organic", child: Text("Organic & Health Foods")),

                          DropdownMenuItem(value: "tools", child: Text("Tools & Equipment")),
                          DropdownMenuItem(value: "car_care", child: Text("Car Care & Cleaning")),
                        ],

                        validator: (value){
                          if(value == null) return "add category of your product ";
                        },
                        onChanged:(value){
                         setState(() {
                           category = value.toString();
                         });
                        }

                    ),

                  // add brand
                       TextFormField(
                         controller: brand,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: "add your brand name",
                           filled: true,
                           prefixIcon: Icon(Icons.branding_watermark),
                           fillColor: const Color(0xFFF2F2F2),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                         ),
                         validator: (value){
                           if(value == null || value.isEmpty) return "add brand name ";
                         },
                       ),
                  // add time and date


                       // add button
                       SizedBox(height: 10),
                       ElevatedButton(onPressed: () async{
                         if(key.currentState!.validate() && error == null || error!.isEmpty){
                           return;
                         }
                         //add product
                          AddProductModel add = AddProductModel(id:0,name: name.text, details: details.text, price:int.parse(price.text) ,discount: int.parse(discount.text), productCount: int.parse(itemCount.text), productImage: base64Encode(image!),brand:brand.text,category: category);
                          await ref.read(addProductNotifier.notifier).addProduct(add);
                       },
                         style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.white
                         ),
                           child: Text("Add",style: TextStyle(color: Colors.black),),

                       ),


                     ],
                   )
               ),
             ),



           ],
         ),
      )),
    );
  }
}
