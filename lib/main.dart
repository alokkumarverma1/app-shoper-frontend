import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoper/core/thems/MyColors.dart';
import 'package:shoper/core/router/MyAppRouter.dart';

void main(){
  runApp(const ProviderScope(child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: myapprouter,
      theme: ThemeData(
        scaffoldBackgroundColor: Mycolors.myapp,
      ),
      debugShowCheckedModeBanner: false,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.touch,
        }
      ),
    );
  }
}
