import 'package:flutter/material.dart';


class Homebanner extends StatefulWidget {
  const Homebanner({super.key});

  @override
  State<Homebanner> createState() => _HomebannerState();
}

class _HomebannerState extends State<Homebanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(3, 3),
              spreadRadius: 2,
              color: Colors.black12,
            )
          ],
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
