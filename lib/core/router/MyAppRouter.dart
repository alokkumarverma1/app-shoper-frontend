import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/screens/homescreens/HomeScreen.dart';
import 'package:shoper/screens/searchscreen/Search_Screen.dart';
import 'package:shoper/screens/shopscreen/ShopDetails.dart';
import 'package:shoper/screens/shopscreen/ShopScreen.dart';
import 'package:shoper/screens/setting/SettingScreen.dart';
import 'package:shoper/layouts/ShellScreen.dart';


final GoRouter myapprouter = GoRouter(
  initialLocation: "/",
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return Shellscreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Homescreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/shop',
          builder: (context, state) => const Shopscreen(),
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => const Settingscreen(),
        ),
      ],
    ),

   // add your other routs

    GoRoute(
        path:'/shop/shopDetails',
      builder: (context ,state)=> const Shopdetails(),
    ),
  ],
);
