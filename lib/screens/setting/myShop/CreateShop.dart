import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/provider/ShopProvider.dart';
import 'package:shoper/app/state/ShopState.dart';
import 'package:shoper/widget/extra/Popup.dart';
import '../../../core/responcive/Responcive_design.dart';


class Createshop extends ConsumerStatefulWidget {
  const Createshop({super.key});

  @override
  ConsumerState<Createshop> createState() => _CreateshopState();
}

class _CreateshopState extends ConsumerState<Createshop> {
  final key = GlobalKey<FormState>();
  final shopName = TextEditingController();
  final location = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ref.listen<ShopState>(shopNotifierProvider,(previous,next){
      if(next.myShop == true){
        showDialog(context: context, builder:(_)=> Popup(title: next.message.toString(), icon: Icons.check));
        Future.delayed(Duration(seconds: 2),(){
        context.pop('/myShop');
        });
      }
      if(next.myShop == false){
        showDialog(context: context, builder:(_)=> Popup(title: next.message.toString(), icon: Icons.error));
        Future.delayed(Duration(seconds: 2),(){
        });
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
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.white,
                  child:ClipOval(
                    child: Image.asset('assets/images/shop.png',height: 90,),
                  ),
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
                              controller: shopName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "shop name",
                                filled: true,
                                prefixIcon: Icon(Icons.person),
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                              ),
                              validator: (value){
                                if(value == null){
                                  return "add shop name";
                                }
                              },
                            ),

                            TextFormField(
                              controller:location,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "shop location",
                                filled: true,
                                prefixIcon: Icon(Icons.location_pin),
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide.none),
                              ),
                              validator: (value){
                                if(value == null){
                                  return "enter your location";
                                }
                              },
                            ),

                            // loign button
                            SizedBox(height: 10,),
                            ElevatedButton(
                                onPressed: ()async{
                                if(!key.currentState!.validate()){
                                  return ;
                                }
                                ShopModel shopModel = ShopModel(shopName:shopName.text, number: 0, mail: "", location: location.text);
                               await ref.read(shopNotifierProvider.notifier).createShop(shopModel);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: Text("create",style: TextStyle(color: Colors.black),)
                            ),
                            SizedBox(height: 10,),



                          ],
                        )
                    ),
                  ),







                ],
              ),
            ),
          )
      ),
    );
  }
}
