import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/provider/AuthProvider.dart';
import 'package:shoper/app/state/AuthState.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:shoper/widget/extra/Popup.dart';
import '../../app/model/RegisterModel.dart';



class Registerscreen extends ConsumerStatefulWidget {
  const Registerscreen({super.key});

  @override
  ConsumerState<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends ConsumerState<Registerscreen> {

  // form controllet
final key = GlobalKey<FormState>();
final name = TextEditingController();
final number = TextEditingController();
final mail = TextEditingController();
final location = TextEditingController();
final password = TextEditingController();
final repassword = TextEditingController();


  @override
  Widget build(BuildContext context) {

    ref.listen<AuthState>(authNotifierProvider, (previous ,next){
      showDialog(
          context: context,
          builder: (_)=> Popup(title: next.message, icon: Icons.error)
      );
      Future.delayed(Duration(seconds: 2));
       if(next.success){
         return context.go('/login');
       }
       Popup(title: next.message,icon: Icons.cancel,);
    });
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // register image area
                SizedBox(height: 30,width: double.infinity),
                ClipOval(
                  child: Image.asset('assets/images/privacy.png'),
                ),
                SizedBox(height: 30,width: double.infinity),
                // register form area

                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(20),
                  width: ResponciveDesign(context).searchFieldWidht(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Form(
                    key: key,
                    child: Column(
                      spacing: 15,
                      children: [

                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: name,
                          decoration: InputDecoration(
                              hintText: "name",
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              fillColor: const Color(0xFFF2F2F2),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none)
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty)
                              return "please add name";
                          },
                        ),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: number,
                          decoration: InputDecoration(
                            hintText: "number",
                            filled: true,
                            prefixIcon: Icon(Icons.call),
                              fillColor: const Color(0xFFF2F2F2),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none)
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty)
                              return "please add number";
                          },
                        ),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: mail,
                          decoration: InputDecoration(
                              hintText: "email",
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              fillColor: const Color(0xFFF2F2F2),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none)
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty || !value.contains('@'))
                              return "please add proper email";
                          },
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller:location,
                          decoration: InputDecoration(
                              hintText: "city",
                              filled: true,
                              prefixIcon: Icon(Icons.local_activity),
                              fillColor: const Color(0xFFF2F2F2),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none)
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty)
                              return "please add city";
                          },
                        ),

                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "password",
                              filled: true,
                              prefixIcon: Icon(Icons.panorama_fish_eye),
                              fillColor: const Color(0xFFF2F2F2),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none)
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty)
                              return "please add password";
                          },
                        ),

                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: repassword,
                          decoration: InputDecoration(
                              hintText: "re-password",
                              filled: true,
                              prefixIcon: Icon(Icons.password),
                              fillColor: const Color(0xFFF2F2F2),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none)
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "please add password";
                            };
                            if(value != password.text){
                              return "password not match";
                            }
                          }
                        ),

                        // summit button
                       SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: () async{
                              if(!key.currentState!.validate()){
                                return;
                              }
                             final registerData = RegisterModel(
                                 name: name.text,
                                 number:int.parse(number.text),
                                 mail: mail.text,
                               location: location.text,
                                 password: password.text,
                             );
                            final res =await ref.read(authNotifierProvider.notifier).register(registerData);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              fixedSize: Size(140, 37)
                            ),
                          child: Text("Register"),
                           ),



                        // other data
                        InkWell(
                          onTap: (){
                            context.push('/login');
                          },
                          child: Text("Already have a acount"),
                        ),

                      ],
                    ),
                  ),
                ),

                // register bottom data area
                SizedBox(height: 10,),
                Text("OR",style: TextStyle(fontWeight: FontWeight.bold),),

                // google and facebook loign data
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
          )
      ),
    );
  }
}
