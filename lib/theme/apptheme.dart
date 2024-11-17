import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.grey.shade900,
      inversePrimary: Colors.grey.shade600,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.white,
        ));
