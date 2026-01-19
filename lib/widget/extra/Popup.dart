import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Popup extends StatelessWidget {
   final String title;
  final IconData icon;
  const Popup({ required this.title ,required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$title',style: TextStyle(fontSize: 20),),
      icon: Icon(icon),
      backgroundColor: Colors.white,
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("OK"))
      ],
    );
  }
}
