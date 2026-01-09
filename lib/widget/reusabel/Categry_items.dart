import 'package:flutter/material.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';


class CategryItems extends StatelessWidget {
  const CategryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: ResponciveDesign(context).categryItemsHeight(),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(3, 3),
            spreadRadius: 2,
            color: Colors.black12,
          )
        ],
      ),
      child: Image.asset('assets/images/phone.png',),
    );
  }
}
