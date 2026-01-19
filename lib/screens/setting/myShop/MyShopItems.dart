import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shoper/app/provider/ShopProductProvider.dart';
import 'package:shoper/widget/reusabel/MyShopProducts.dart';
import '../../../core/responcive/Responcive_design.dart';

class MyShopItems extends ConsumerStatefulWidget {
  const MyShopItems({super.key});

  @override
  ConsumerState<MyShopItems> createState() => _MyShopItemsState();
}

class _MyShopItemsState extends ConsumerState<MyShopItems> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(addProductNotifier);
    final product = data.allMyShopProduct ?? [];

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 38,
                      maxWidth:ResponciveDesign(context).searchFieldWidht(),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 🎛 Filter & Add Product buttons
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 10),

                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 400,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: const [
                                    SizedBox(height: 10),
                                    Center(child: Text("Add Filters")),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.filter_list, color: Colors.black),
                            SizedBox(width: 5),
                            Text(
                              "Filter",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          context.push('/addProduct');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add, color: Colors.black),
                            SizedBox(width: 5),
                            Text(
                              "Product",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🛒 Product list
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: product.length,
                      (context, index) {
                    final res = product[index];
                    return MyShopProducts(product: res);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
