import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/provider/UserShopProvider.dart';
import 'package:shoper/app/state/UserShopState.dart';
import 'package:shoper/core/responcive/Responcive_design.dart';
import 'package:shoper/core/thems/MyColors.dart';


class Myshop extends ConsumerStatefulWidget{
  const Myshop({super.key});

  @override
  ConsumerState<Myshop> createState() => _MyshopState();
}

class _MyshopState extends ConsumerState<Myshop> {

  final List<Map<String,dynamic>> cardItems = [
    {
      "icon" : Icons.storefront,        // shop details
      "title" : "Shop Details",
      "routs" : '/myShopDetails'
    },
    {
      "icon" : Icons.inventory_2,       // all products
      "title" : "All Products",
      "routs" : '/myShopItems'
    },
    {
      "icon" : Icons.receipt_long,      // orders list
      "title" : "All Orders",
      "routs" : '/myShopOrders',
    },
    {
      "icon" : Icons.bar_chart,         // revenue / earnings
      "title" : "Your Revenue",
      "routs" : '/myShopRevenue',
    },
  ];



  // call apis
  void initState(){
    super.initState();
    Future.microtask(()=> ref.read(shopNotifierProvider.notifier).getShop());
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(shopNotifierProvider);
   ref.listen<ShopState>(shopNotifierProvider,(previous, next){
     if(next.myShop == false){
         context.push("/createShop");
     }
   });

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(

          child: GridView.builder(
            itemCount:cardItems.length,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                 maxCrossAxisExtent: 300,
                childAspectRatio: 1/0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
              itemBuilder: (context , index){
              final card = cardItems[index];
                return InkWell(
                  onTap: (){
                    context.push(card["routs"]);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Icon(card['icon'],size: 50,color: Mycolors.buttons,),
                        Text(card["title"]),
                      ],
                    ),
                  ),
                );
              }
          ),
          ),
        );
  }
}
