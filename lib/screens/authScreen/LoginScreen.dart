import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // login image in yout login page
                   ClipOval(
                     child: Image.asset('assets/images/privacy.png',height: 90,width: 90,),
                   ),

                  // login form in page
                  Container(
                    width: ResponciveDesign(context).searchFieldWidht(),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 3,
                          spreadRadius: 3,
                          color: Colors.grey,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child:Form(
                        child:Column(
                          spacing: 20,
                          children: [

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "your email",
                                filled: true,
                                prefixIcon: Icon(Icons.email),
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                              ),
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "your password",
                                filled: true,
                                prefixIcon: Icon(Icons.password),
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                              ),
                            ),

                            // loign button
                            SizedBox(height: 10,),
                            ElevatedButton(
                                onPressed:(){
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.black,
                                    fixedSize: Size(140, 37)
                                ),
                                child: Text("Login",style:TextStyle(color: Colors.black),)
                            ),

                            InkWell(
                              onTap: (){
                                context.push('/register');
                              },
                              child: Text("Don't have a acount"),
                            ),

                          ],
                        )
                    ),
                  ),

                  SizedBox(height: 20,),
                  Text("OR",style: TextStyle(fontWeight: FontWeight.bold),),


                  // google and facebook login items
                  Container(
                    height: 90,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        InkWell(
                          onTap:(){
                          },
                          child: Image.asset('assets/images/google.png',height: 40,width: 40,),
                        ),
                        InkWell(
                          onTap:(){
                          },
                          child: Image.asset('assets/images/facebook.png',height: 40,width: 40,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),







                ],
              ),
            ),
          )
      ),
    );
  }
}
