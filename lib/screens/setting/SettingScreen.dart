import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoper/widget/reusabel/Setting_items.dart';


class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [


           // profile section
            Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            
            SettingItems(title: "Profile",icon: Icons.person,routs:'/profile',),
            SizedBox(height: 10,),
            SettingItems(title: "Orders",icon: Icons.card_travel,routs: '/profile',),
            SizedBox(height: 10,),
            SettingItems(title: "My Shop",icon: Icons.shop,routs: '/myShop',),

            // more setting items
            SizedBox(height: 15,),
            Text("More",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 15,),

            SettingItems(title: "App Setting",icon: Icons.supervised_user_circle ,routs: '/appSetting',),
            SizedBox(height: 10,),
            SettingItems(title: "Privacy",icon: Icons.card_travel,routs: '/privacy',),
            SizedBox(height: 10,),

            // support section
            SizedBox(height: 15,),
            Text("Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 15,),

            SettingItems(title: "Contact Us",icon: Icons.supervised_user_circle ,routs: '/contactUs',),
            SizedBox(height: 10,),
            SettingItems(title: "About Us",icon: Icons.card_travel,routs: '/about',),
            SizedBox(height: 10,),


            // logout button in app
            SizedBox(height: 30),
            Material(
             elevation: 3,
             borderRadius: BorderRadius.circular(20),
             child: InkWell(
               onTap: (){},
               child: Container(
                 height: 60,
                 child: Center(
                   child: Text("Logout",style: TextStyle(color: Colors.red,fontSize: 15),),
                 ),
               ),
             )
            )



          ],
        )
    );
  }
}
