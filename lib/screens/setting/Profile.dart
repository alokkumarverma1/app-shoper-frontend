import 'package:flutter/material.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                SizedBox(width: double.infinity,),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  width: ResponciveDesign(context).searchFieldWidht(),
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(3, 3),
                          spreadRadius: 2,
                        ),
                      ]
                  ),
                  child: Column(
                    spacing: 20,
                    children: [

                      // profile photo
                      Container(
                       height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle
                        ),
                      ),

                      // details of user
                      SizedBox(height: 20,),
                      Container( child: Row (spacing: 5, children: [Icon(Icons.person),Text("Username")],),),
                      Container( child: Row (spacing: 5, children: [Icon(Icons.phone),Text("8172984928")],),),
                      Container( child: Row (spacing: 5, children: [Icon(Icons.email),Text("alok@gmail.com")],),),
                      Container( child: Row (spacing: 5, children: [Icon(Icons.location_pin),Text("ballis up")],),),

                      // change button
                      SizedBox(height: 30,),
                      ElevatedButton(
                          onPressed:(){},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          child: Text("Update",style: TextStyle(color: Colors.black),)
                      )
                    ],
                  ),
                ),




              ],
            )
          ),
    ),
    );
  }
}
