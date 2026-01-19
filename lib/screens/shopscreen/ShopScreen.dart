import 'package:flutter/material.dart';
import 'package:shoper/widget/reusabel/MyShopProducts.dart';
import '../../core/responcive/Responcive_design.dart';

class Shopscreen extends StatelessWidget {
  const Shopscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: CustomScrollView(
            slivers: [

           // search item in shop page

           SliverToBoxAdapter(
             child: Center(
               child: Container(
                 height: 35,
                 width: ResponciveDesign(context).searchFieldWidht(),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(14),
                   boxShadow: [
                     BoxShadow(
                       offset: Offset(5, 5),
                       blurRadius: 2,
                       color: Colors.black12,
                     )
                   ]
                 ),
                 child: TextField(
                   decoration: InputDecoration(
                     hint: Text("Search"),
                     prefixIcon: Icon(Icons.search),
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide.none)
                   ),

                 ),
               ),
             ),
           ),

// shop items in shop pages

            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),


          SliverGrid(
              delegate: SliverChildListDelegate(
                [

                ]
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio:2/1,

              )
          ),




          ],
        ),
        ),
    );
  }
}
