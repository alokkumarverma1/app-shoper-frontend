import 'package:flutter/material.dart';

class SettingItems extends StatelessWidget {
  final String title;
  final IconData icon;
  const SettingItems({super.key,required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
          onTap: (){
          },
          child:Container(
            height: 70,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(icon,),
                SizedBox(width: 10,),
                Text("$title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
              ],
            ),
          )
      ),
    );
  }
}
