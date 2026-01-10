
import 'package:flutter/material.dart';


class Cartitems extends StatelessWidget {
  const Cartitems({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
      child: InkWell(
        onTap: (){
        },
        child: Container(
         height: 80,
          width: double.infinity,
          padding: EdgeInsets.only(right: 20),
          child: Row(

            children: [
             Image.asset('assets/images/phone.png',height: 50,width: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Phone item"),
                  Text("499",style: TextStyle(fontWeight: FontWeight.w700),),
                  Row(
                    children: [
                      Text("***"),
                      Text("(3414)"),
                    ],
                  )
                ],
              ),
              Spacer(),
              Icon(Icons.delete),


            ],
          ),
        ),
      ),
    );
  }
}
