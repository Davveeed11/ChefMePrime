import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final String name;
  final VoidCallback ontap;

  const Tile({super.key, required this.name, required this.ontap});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: widget.ontap,
        child: Container(
          width: 260,
          height: 70,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.black45, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
