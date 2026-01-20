import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/provider/ShopScreenProvider.dart';
import 'package:shoper/core/thems/MyColors.dart';
import 'package:shoper/widget/reusabel/ProductCard.dart';
import '../../core/responcive/Responcive_design.dart';

class ShopDetails extends ConsumerWidget {
  final ShopModel shopModel;
   ShopDetails({super.key,required this.shopModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final screen = MediaQuery.of(context).size.width;
    final width = MediaQuery.of(context).size.width;
    // call api
    final result = ref.watch(shopScreenNotifierProvider);
    final data = result.addProductModel ?? [];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [


            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "Shop Details",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Mycolors.myapp,
                        ),
                        child: const Icon(
                          Icons.storefront,
                          size: 60,
                          color: Mycolors.buttons,
                        ),
                      ),

                      const SizedBox(height: 10),

                       Text(shopModel.shopName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        shopModel.location,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 12),

                     screen < 320 ?  ConstrainedBox(
                       constraints: BoxConstraints(maxWidth: 300),
                       child:     Column(
                         spacing: 5,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           _actionButton(Icons.email, shopModel.email),
                           const SizedBox(width: 12),
                           _actionButton(Icons.call, shopModel.number.toString()),
                         ],
                       ),
                     ) :  ConstrainedBox(
                       constraints: BoxConstraints(maxWidth:400),
                       child:     Row(
                         spacing: 5,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           _actionButton(Icons.email, shopModel.email),
                           const SizedBox(width: 12),
                           _actionButton(Icons.call, shopModel.number.toString()),
                         ],
                       ),
                     )




                    ],
                  ),
                ),
              ),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search products",
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
            ),

            // all shop product
            const SliverPadding(padding: EdgeInsets.only(top: 16)),

           SliverPadding(
             padding: EdgeInsets.all(10),
             sliver: SliverGrid.builder(
               itemCount: data.length,
                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                     maxCrossAxisExtent: 160,
                   mainAxisExtent: 160,
                   childAspectRatio: 0.9/1,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10
                 ),
               itemBuilder: (BuildContext context, int index)
               {
                 final productDetails = data[index];
               return ProductCard(addProductModel: productDetails,);
               },
             ),
           ),


            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      ),
    );
  }


  Widget _actionButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Mycolors.myapp,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Mycolors.buttons),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Mycolors.buttons,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

 // end
}
