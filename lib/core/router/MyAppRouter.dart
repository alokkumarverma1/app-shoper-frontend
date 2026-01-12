import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoper/app/service/AuthService.dart';
import 'package:shoper/screens/authScreen/LoginScreen.dart';
import 'package:shoper/screens/authScreen/RegisterScreen.dart';
import 'package:shoper/screens/authScreen/StartingScreen.dart';
import 'package:shoper/screens/cartScreen/CartScreen.dart';
import 'package:shoper/screens/homescreens/HomeScreen.dart';
import 'package:shoper/screens/searchscreen/Search_Screen.dart';
import 'package:shoper/screens/setting/MyShop.dart';
import 'package:shoper/screens/setting/Profile.dart';
import 'package:shoper/screens/shopscreen/ShopDetails.dart';
import 'package:shoper/screens/shopscreen/ShopScreen.dart';
import 'package:shoper/screens/setting/SettingScreen.dart';
import 'package:shoper/layouts/ShellScreen.dart';


final GoRouter myapprouter = GoRouter(
  initialLocation: "/start",
  routes: [

    GoRoute(
        path: '/start',
      builder: (context ,state) => Startingscreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context,state) => const Loginscreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context,state) => const Registerscreen(),
    ),

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
          redirect: (context ,state) async{
           bool chek= await AuthService().islogin();
           return chek ? null : '/login';
          }
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => const Settingscreen(),
        ),
      ],
    ),

   // All shop page routs there
    GoRoute(
        path:'/shop/shopDetails',
      builder: (context ,state)=> const Shopdetails(),
    ),
    GoRoute(
      path:'/myShop',
      builder: (context ,state)=> const Myshop(),
    ),



    // all cart routs there
    GoRoute(
        path: '/cart',
      builder: (context ,state) => const Cartscreen(),
    ),

    // all setting routs
    GoRoute(
      path: '/profile',
      builder: (context,state)=> Profile(),
    ),






  ],
);
