import 'package:flutter/material.dart';

Widget genericText(String text, Color color, FontWeight weight, double fontSize) {
  return Text(
    text,
    style: TextStyle(
      fontStyle: FontStyle.normal,
      color: color,
      fontWeight: weight,
      fontSize: fontSize,
    )
  );
}