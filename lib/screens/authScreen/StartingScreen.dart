import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Startingscreen extends StatefulWidget {
  const Startingscreen({super.key});

  @override
  State<Startingscreen> createState() => _StartingscreenState();
}


class _StartingscreenState extends State<Startingscreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      context.replace('/');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              // Text("Shoper",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
              // SizedBox(height: 30,),
              Container(
                height: 100,
                width: double.infinity,
                child: ClipOval(
                  child: Image.asset('assets/images/start.png'),
                ),
              ),

              SizedBox(
                height: 50,
              ),

            ],
          ),
        )
    );
  }
}
