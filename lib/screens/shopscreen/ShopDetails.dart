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
         child: CustomScrollView(
           slivers: [

             // shop header item
             SliverToBoxAdapter(
               child: Container(
                 height: 200,
                 width: ResponciveDesign(context).searchFieldWidht(),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.15), // halka black
                         blurRadius: 8,
                         spreadRadius: 1,
                         offset: Offset(0, 3), // neeche shadow
                       ),
                     ],
                     color: Colors.white
                 ),
                 child:Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.grey
                           ),
                           child: Column(
                             children: [
                               Container(
                                 height:100,
                                 width: 100,
                                 decoration: BoxDecoration(
                                     shape: BoxShape.circle
                                 ),
                                 child: Stack(
                                   children: [
                                     Positioned(
                                       child: Icon(Icons.message),
                                       top: 70,
                                       left: 0,
                                     )
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                         Text("shop name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                         Text("shop name"),
                       ],
                     )
                 ),
               ),
             ),

             // search item in my shop

             SliverToBoxAdapter(
               child: Container(
                 height: 40,
                 width: 30,
                 margin: EdgeInsets.only(top: 20),
                 decoration: BoxDecoration(
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.15), // halka black
                         blurRadius: 8,
                         spreadRadius: 1,
                         offset: Offset(0, 3), // neeche shadow
                       ),
                     ]
                 ),
                 child: Form(
                   child: TextFormField(
                     decoration: InputDecoration(
                         prefixIcon: Icon(Icons.search),
                         suffixIcon: Icon(Icons.list),
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
                         hintText: "search",
                         filled: true,
                         fillColor: Colors.white
                     ),
                   ),
                 ),
               ),
             )

           ],
         ),
      ),
    );
  }
}
