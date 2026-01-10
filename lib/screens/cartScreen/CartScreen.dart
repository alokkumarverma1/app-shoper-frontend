import 'package:flutter/material.dart';
import 'package:shoper/widget/reusabel/CartItems.dart';
import 'package:shoper/widget/reusabel/ShopItems.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
      ),
      // body of cart
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
         child: Column(
           spacing: 20,
           children: [
             Cartitems(),
             Cartitems(),
             Cartitems(),
             Cartitems(),
             Cartitems(),
             Cartitems()
           ],
         ),
          ),
      ),
    );
  }
}
