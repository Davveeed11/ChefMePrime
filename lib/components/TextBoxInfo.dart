import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:flutter/material.dart';

class Textboxinfo extends StatefulWidget {
  final String fieldName;
  final String UserName;
  final VoidCallback ontap;

  const Textboxinfo(
      {super.key,
      required this.fieldName,
      required this.UserName,
      required this.ontap});

  @override
  State<Textboxinfo> createState() => _TextboxinfoState();
}

class _TextboxinfoState extends State<Textboxinfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(
          7,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.fieldName,
                style: AppStyle.headlineStyle1.copyWith(color: Colors.black),
              ),
              InkWell(onTap: widget.ontap, child: const Icon(Icons.update)),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                widget.UserName,
                style: AppStyle.textStyle.copyWith(color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
