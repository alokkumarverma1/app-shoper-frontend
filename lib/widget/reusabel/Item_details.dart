import 'package:flutter/material.dart';


class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
            children: [
              Text("items details page"),
              Text("items details page"),
            ],
          )
      ),
    );
  }
}
