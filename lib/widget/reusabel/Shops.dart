import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/provider/ShopScreenProvider.dart';
import 'package:shoper/app/provider/UserShopProvider.dart';
import 'package:shoper/core/thems/MyColors.dart';

class Shops extends ConsumerWidget {
  final ShopModel shopModel;
  const Shops({super.key,required this.shopModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      child: Stack(
        children: [

      // shop name banner
          Positioned(
            top: 50,
            left: 80,
            child:  Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child:
              Center(child: Text(shopModel.shopName),)
              ,),
          ),

      // shop icon data
          Positioned(
            top: 20,
            child: Material(
              shadowColor: Colors.black,
               color: Colors.white,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: ()async{
                 await ref.read(shopScreenNotifierProvider.notifier).getAllProduct(shopModel.id!);
                  context.push('/shopDetails',extra: shopModel);
                },
                borderRadius: BorderRadius.circular(50),
                splashColor: Mycolors.buttons.withOpacity(0.2),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.storefront, // better icon
                    color: Mycolors.buttons,
                    size: 70,
                  ),
                ),
              ),
            ),
          ),

          // end of shop data

        ],
      ),
    );
  }
}
