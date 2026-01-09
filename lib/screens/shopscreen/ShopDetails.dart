import 'package:flutter/material.dart';

import '../../core/responcive/Responcive_design.dart';
import '../../widget/reusabel/Categry_items.dart';


class Shopdetails extends StatelessWidget {
  const Shopdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),

      // body

      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Stack(
              children: [
                Column(
                children: [

                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // profile

                        Container(
                          height:120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // details of data
                        Text("Name Of SHop",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("location of shop"),

                      ],
                    ),
                  ),

                  // all categry of shop

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


                  // all latest product add in this shop







                ],
              ),
            ],
            ),
          )
      ),
    );
  }
}
