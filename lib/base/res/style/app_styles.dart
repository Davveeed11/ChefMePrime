import 'package:flutter/material.dart';

Color primary = const (0xFF787daf,) as Color;

class AppStyle {
  static Color primaryColor = primary;
  static Color textColor = Colors.blueGrey;

  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textColor,
  );
  static TextStyle headlineStyle1 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle headlineStyle2 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headlineStyle3 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
}
