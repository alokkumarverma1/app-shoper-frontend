import 'package:flutter/material.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Center(
            child: ClipOval(
             child: Container(
               height: 50,
               width: 50,
               color: Colors.grey,
             ),
            ),
          ),
          
          // user reviews 
          Text("This is one of the best product of this site you can easly bay and use products and you thik"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          )
        ],
      ),
    );
  }
}
