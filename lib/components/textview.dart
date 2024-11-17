import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String BigText;
  final String SmallText;

  const TextView({
    super.key,
    required this.BigText,
    required this.SmallText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(BigText,style: AppStyle.headlineStyle3,),InkWell(onTap: () {
            
          },child: Text(SmallText,style: AppStyle.textStyle.copyWith(
            color: Colors.grey
          ),),)
        ],
      );
  }
}
