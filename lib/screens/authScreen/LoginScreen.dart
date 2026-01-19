import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/model/LoginModel.dart';
import 'package:shoper/app/provider/AuthProvider.dart';
import 'package:shoper/app/state/AuthState.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:shoper/widget/extra/Popup.dart';


class Loginscreen extends ConsumerStatefulWidget{
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends ConsumerState<Loginscreen> {
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authstate = ref.watch(authNotifierProvider);
    ref.listen<AuthState>(authNotifierProvider,(previous, next){
      if(next.success == true){
        showDialog(
            context: context,
            builder: (_) => Popup(title:next.message ,icon: Icons.bolt,) );
        Future.delayed(const Duration(seconds: 2),(){
          return context.replace('/');
        });
      }
      if(next.success == false){
        showDialog(context: context, builder: (_)=> Popup(title: next.message, icon: Icons.cut));
      }
    });
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
                        key: key,
                        child:Column(
                          spacing: 20,
                          children: [

                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "your email",
                                filled: true,
                                prefixIcon: Icon(Icons.email),
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                              ),
                              validator: (value){
                                if(value == null || !value.contains('@gmail.com') ){
                                  return "add proper email address";
                                }
                              },
                            ),

                            TextFormField(
                              controller: password,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "your password",
                                filled: true,
                                prefixIcon: Icon(Icons.password),
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                              ),
                              validator: (value){
                                if(value == null){
                                  return "enter your password";
                                }
                              },
                            ),

                            // loign button
                            SizedBox(height: 10,),
                            ElevatedButton(
                                onPressed:()async{
                                  if(!key.currentState!.validate()){
                                    return ;
                                  }
                                  final loginModel= LoginModel(mail: email.text, password:password.text);
                                  await ref.read(authNotifierProvider.notifier).login(loginModel);
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

