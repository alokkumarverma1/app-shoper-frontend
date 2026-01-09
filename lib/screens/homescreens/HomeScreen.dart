import 'package:flutter/material.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:shoper/widget/reusabel/Categry_items.dart';
import 'package:shoper/widget/reusabel/HomeBanner.dart';
import 'package:shoper/widget/reusabel/Home_items.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            children: [

              // 🔹 Banner slider
              SizedBox(
                height: ResponciveDesign(context).bannerheight(),
                child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(int a=1; a<4;a++)
                        Homebanner(),
                    ]
                ),
              ),

              // categry items list
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

              // trending items

              SizedBox(height: 10,),
              Center(
                child: Text("Trending",style: TextStyle(fontWeight: FontWeight.bold),),
              ),

              // tranding phone items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phones",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){}, child: Text("Show All"))
                ],
              ),
              SizedBox(
                height: ResponciveDesign(context).homeItemHeight() + 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for(int a=1; a<10;a++)
                      HomeItems(),
                  ],
                ),
              ),


              // tranding phone shoes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shoes",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){}, child: Text("Show All"))
                ],
              ),

              SizedBox(
                height: ResponciveDesign(context).homeItemHeight() + 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for(int a=1; a<10;a++)
                      HomeItems(),
                  ],
                ),
              ),

              // tranding cloth items

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cloth",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){}, child: Text("Show All"))
                ],
              ),
              SizedBox(
                height: ResponciveDesign(context).homeItemHeight() + 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for(int a=1; a<10;a++)
                      HomeItems(),
                  ],
                ),
              ),

              // show more button

              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Explore more",style: TextStyle(color: Colors.black),)),

              // fast delevery animation

              // safe and secure animation






              SizedBox(height: 100,)

            ],
          ),
        ));
  }
}
