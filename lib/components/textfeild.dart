import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final IconData iconData;
  final bool obscure;
  const MyTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.iconData,
      required this.obscure});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: TextField(
        obscureText: widget.obscure,
        controller: widget.controller,
        maxLines: 1,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.iconData),
          hintText: widget.hintText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          focusColor: Colors.blue,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      ),
    );
  }
}
