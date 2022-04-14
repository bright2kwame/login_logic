import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle textStyle(Color color, double fontSize) {
    return TextStyle(color: color, fontSize: fontSize);
  }

  TextStyle textStyleBold(Color color, double fontSize) {
    return TextStyle(
        color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
  }
}
