import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/app/model/ShopModel.dart';
import 'package:shoper/app/provider/ShopScreenProvider.dart';
import 'package:shoper/widget/reusabel/Shops.dart';
import '../../core/responcive/Responcive_design.dart';

class ShopScreen extends ConsumerStatefulWidget{
  const ShopScreen({super.key});

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
   String search="";
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(shopScreenNotifierProvider);
    final shops = res.shopModel ?? [];
    final List<ShopModel> shopData = search.isEmpty ? shops : shops.where((item) => item.shopName.toLowerCase().contains(search.toLowerCase())).toList();
    if(res.loading == true){
      return SafeArea(child: Center(child: CircularProgressIndicator(),));
    }if(res.shopModel!.length == 0){
      return SafeArea(child: Center(child: Text("no any shop")));
    }
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10,left: 20,right: 20),
        child: CustomScrollView(
          slivers: [

            // search item in shop page

            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: 35,
                  width: ResponciveDesign(context).searchFieldWidht(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 2,
                          color: Colors.black12,
                        )
                      ]
                  ),
                  child: TextFormField(
                    onChanged: (value){
                      setState(() {
                        search = value;
                      });
                    },
                    decoration: InputDecoration(
                        hint: Text("Search"),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide.none)
                    ),
                  )
                ),
              ),
            ),

// shop items in shop pages

            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),

// all product of items
          SliverGrid.builder(
              itemCount: shopData.length,
           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 300,
             childAspectRatio: 1/0.7
           ),
            itemBuilder: (BuildContext context, int index) {
                final data= shopData[index];
                return Shops(shopModel: data,);
            },

          )




          ],
        ),
      ),
    );
  }
}

