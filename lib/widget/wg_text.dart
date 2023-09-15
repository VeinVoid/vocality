import 'package:flutter/material.dart';

Widget TextWidget
({
  required String text,
  required double fontSize,
  required FontWeight fontWeight,
  required TextOverflow fontOverflow,
  String? fontFamily,
  int? maxLines,
  Color? fontColor
  }){
  return Text(
    text,
    maxLines: maxLines,
    overflow: fontOverflow,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: fontColor
    ),
  );
}