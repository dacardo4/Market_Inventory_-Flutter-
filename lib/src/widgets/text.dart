import 'package:flutter/material.dart';

Widget genericText(String text, int color, FontWeight weight, double fontSize) {
  return Text(
    text,
    style: TextStyle(
      fontStyle: FontStyle.normal,
      color: Color(color),
      fontWeight: weight,
      fontSize: fontSize,
    )
  );
}