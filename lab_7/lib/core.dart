import 'package:flutter/material.dart';

import 'bmi.dart';

BMI bmi = BMI();

class AppColors {
  static const Color backgroundColor = Color(0xFF1D2136);
  static const Color containerColor = Color(0xFF24263B);
  static const Color iconColor = Colors.white;
  static const Color sliderColor = Colors.pink;
  static const Color buttonBackgorundColor = Color(0xFF5E5E6E);
}

class AppStyles {
  static TextStyle textStyle(
          {double fontSize = 14,
          Color color = Colors.white,
          FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static double iconSize = 50;
}
