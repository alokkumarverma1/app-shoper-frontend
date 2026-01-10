import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Startingscreen extends StatelessWidget {
  const Startingscreen({super.key});

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
              ElevatedButton(
                  onPressed: (){
                    context.push('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(100,40),
                  ),
                  child: Text("Start",style: TextStyle(color: Colors.black),)
              )


            ],
          ),
      )
    );
  }
}
