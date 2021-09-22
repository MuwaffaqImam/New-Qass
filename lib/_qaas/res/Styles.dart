import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_template/Screen/Template4/Style/ThemeT4.dart';

class MyTextStyle {
  static TextStyle buildStyle({
    fontFamily = "Sofia",
    @required color,
    fontWeight = FontWeight.w700,
    fontSize = 15.0,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize);
  }
}
