import 'package:flutter/material.dart';

class BottonTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData icon;

  const BottonTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap, required this.icon});

  @override
  State<BottonTile> createState() => _BottonTileState();
}

class _BottonTileState extends State<BottonTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ListTile(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
        leading: Icon(widget.icon),
        style: ListTileStyle.drawer,
        onTap: widget.onTap,
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
        ),
        title: Text(
          widget.title,
        ),
        subtitle: Text(
          widget.subtitle,
        ),
      ),
    );
  }
}
