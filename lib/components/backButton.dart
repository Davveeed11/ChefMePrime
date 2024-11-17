import 'package:flutter/material.dart';

class backbutton extends StatelessWidget {
  const backbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white24,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
        ),
      ),
    );
  }
}
