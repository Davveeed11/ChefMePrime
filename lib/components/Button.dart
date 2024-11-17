import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final VoidCallback tap;

  const Button({super.key, required this.title, required this.tap});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tap,
      child: Container(
        width: 270,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child:
            Center(
              child: Text(
                widget.title,
               ),
            ),


      ),
    );
  }
}
