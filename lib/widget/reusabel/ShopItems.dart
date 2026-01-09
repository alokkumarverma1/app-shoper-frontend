import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Shopitems extends StatelessWidget {
  const Shopitems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 130,
          width: 230,
          decoration: BoxDecoration(
          ),
          child: Stack(
            children: [

              Positioned(
                  bottom: 25,
                  right: 10,
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(3, 3),
                          spreadRadius: 2,
                          color: Colors.black12,
                        )
                      ],
                    ),
                  )
              ),

              Positioned(
                left: 10,
                  top: 23,
                  child: GestureDetector(
                    onTap: (){
                      context.push('/shop/shopDetails');
                    },
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 10),
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(3, 3),
                            spreadRadius: 2,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: Center(
                        child: Image.asset('assets/images/user.png',height: 60,width: 60,),
                      )
                    ),
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
