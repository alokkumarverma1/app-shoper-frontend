import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shoper/app/model/AddProductModel.dart';
import 'package:shoper/app/state/AuthSecureStorage.dart';
import 'package:shoper/screens/authScreen/LoginScreen.dart';
import 'package:shoper/screens/authScreen/RegisterScreen.dart';
import 'package:shoper/screens/authScreen/StartingScreen.dart';
import 'package:shoper/screens/cartScreen/CartScreen.dart';
import 'package:shoper/screens/homescreens/HomeScreen.dart';
import 'package:shoper/screens/searchscreen/Search_Screen.dart';
import 'package:shoper/screens/setting/About.dart';
import 'package:shoper/screens/setting/AppSetting.dart';
import 'package:shoper/screens/setting/ContactUs.dart';
import 'package:shoper/screens/setting/Privacy.dart';
import 'package:shoper/screens/setting/myShop/CreateShop.dart';
import 'package:shoper/screens/setting/myShop/MyOrders.dart';
import 'package:shoper/screens/setting/myShop/MyRevenue.dart';
import 'package:shoper/screens/setting/myShop/MyShop.dart';
import 'package:shoper/screens/setting/Profile.dart';
import 'package:shoper/screens/setting/myShop/MyShopDetails.dart';
import 'package:shoper/screens/setting/myShop/MyShopItems.dart';
import 'package:shoper/screens/shopscreen/ShopDetails.dart';
import 'package:shoper/screens/shopscreen/ShopScreen.dart';
import 'package:shoper/screens/setting/SettingScreen.dart';
import 'package:shoper/layouts/ShellScreen.dart';
import 'package:shoper/widget/reusabel/MyShopProductDetails.dart';

import '../../screens/setting/myShop/Add_Product.dart';


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
           final chek= await AuthSecureStorage().getToken();
            if(chek == null || Jwt.isExpired(chek)){
              return '/login';
            }
            return null;
          }
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => const Settingscreen(),
        ),
      ],
    ),

   // home page routs

    // search screen routs

    // shop page routs
    GoRoute(
      path:'/shop/shopDetails',
      builder: (context ,state)=> const Shopdetails(),
    ),

   // setting screen routs
    GoRoute(
      path: '/profile',
      builder: (context,state)=> Profile(),
    ),
    GoRoute(
      path:'/myShop',
      builder: (context ,state)=> const Myshop(),
    ),
    GoRoute(
      path:'/createShop',
      builder: (context ,state)=> const Createshop(),
    ),
    GoRoute(
      path:'/myShopDetails',
      builder: (context ,state)=> const MyShopDetails(),
    ),
    GoRoute(
        path: '/myShopProductDetails',
        name: "myShopProductFullDetails" ,
      builder: (context,state){
          final data = state.extra as AddProductModel;
          return MyShopProductDetails(addProductModel:data,);
      }
    ),
    GoRoute(
      path:'/myShopItems',
      builder: (context ,state)=> const MyShopItems(),
    ),
    GoRoute(
      path:'/addProduct',
      builder: (context ,state)=> const AddProduct(),
    ),
    GoRoute(
      path:'/myShopRevenue',
      builder: (context ,state)=> const MyRevenue(),
    ),
    GoRoute(
      path:'/myShopOrders',
      builder: (context ,state)=> const MyOrders(),
    ),
    GoRoute(
      path:'/privacy',
      builder: (context ,state)=> const Privacy(),
    ),
    GoRoute(
      path:'/about',
      builder: (context ,state)=> const About(),
    ),
    GoRoute(
      path:'/contactUs',
      builder: (context ,state)=> const ContactUs(),
    ),
    GoRoute(
      path:'/appSetting',
      builder: (context ,state)=> const AppSetting(),
    ),


    // all cart routs there
    GoRoute(
        path: '/cart',
      builder: (context ,state) => const Cartscreen(),
    ),





  ],
);
