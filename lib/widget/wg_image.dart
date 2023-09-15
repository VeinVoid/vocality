import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget ImageSvg
({
  required String asset,
  required double width,
  required double height,
  BoxFit boxFit = BoxFit.contain
}){
  return SvgPicture.asset(
    asset,
    width: width,
    height: height,
    fit: boxFit,
  );
}