import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Shellscreen extends StatelessWidget  {
  final Widget child;
  const Shellscreen({super.key , required this.child});


  int getindex (String location){
    if(location =='/search') return 1;
    if(location =='/shop') return 2;
    if(location =='/setting') return 3;
    return 0;

  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    return Scaffold(

      // app bar propety

         appBar: AppBar(
          title: const Text(
            "Shoper",
            style: TextStyle(fontWeight:FontWeight.w900),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset('assets/images/cart.png',height: 30,width: 30),
            ),
          ],
        ),

        // child property
        body: SafeArea(child: child),

      // bottom navigation property
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: getindex(location),
          onTap: (index){
            if(index == 0) context.go('/');
            if(index == 1) context.go('/search');
            if(index == 2) context.go('/shop');
            if(index ==3) context.go('/setting');
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search",),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop",),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting",),
          ]),
    );

  }

}
