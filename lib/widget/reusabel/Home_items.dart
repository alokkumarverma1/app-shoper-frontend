import 'package:flutter/material.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: ResponciveDesign(context).homeItemHeight(),
      width:ResponciveDesign(context).homeItemHeight() ,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(5,5),
                blurRadius: 5,
                color: Colors.black12,
                spreadRadius: 2
            )
          ]
      ),
    );
  }
}
