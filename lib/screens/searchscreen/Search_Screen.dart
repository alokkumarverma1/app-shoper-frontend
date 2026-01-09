import 'package:flutter/material.dart';

import '../../core/responcive/Responcive_design.dart';
import '../../widget/reusabel/Categry_items.dart';



class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            children: [

              // search text area in search screen

              Container(
                height: 40,
                width: ResponciveDesign(context).searchFieldWidht(),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      offset: Offset(5, 5),
                      blurRadius: 4,
                      color: Colors.black12
                    )
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text("search item"),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
                    border: InputBorder.none,
                  ),
                ),
              ),

              // categry item in search scree
              SizedBox(height: 10,),
              Center(
                child: Text("All category",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ),
              SizedBox(
                height: ResponciveDesign(context).homeItemHeight() + 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for(int a=1; a<10;a++)
                      CategryItems(),
                  ],
                ),
              ),








            ],
          ),
        )
    );
  }
}
