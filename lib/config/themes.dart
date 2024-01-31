import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//General Color
const Color generalColorWhite = Color.fromARGB(255, 246, 246, 246);
const Color generalColorGray = Color.fromARGB(125, 23, 23, 23);
const Color generalColorDark = Color.fromARGB(255, 23, 23, 23);

//Font
TextStyle tsHeader() => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: generalColorDark,
    fontWeight: FontWeight.w600,
    fontSize: 26,
    height: 1.2
  )
);

TextStyle tsGeneral16({
  bool isHaighlight = false
}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: generalColorDark,
    fontWeight: isHaighlight ? FontWeight.w600 : FontWeight.w500,
    fontSize: 16,
    height: 1.2
  )
);

TextStyle tsGeneral14({
  bool isHaighlight = false
}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: generalColorDark,
    fontWeight: isHaighlight ? FontWeight.w600 : FontWeight.w500,
    fontSize: 14,
    height: 1.2
  )
);

TextStyle tsGeneral12({
  bool isHaighlight = false
}) => GoogleFonts.poppins(
  textStyle: TextStyle(
    color: generalColorGray,
    fontWeight: isHaighlight ? FontWeight.w600 : FontWeight.w500,
    fontSize: 12,
    height: 1.2
  )
);

//Decoration
Decoration dnCircular({
  required double radiusCircular,
  required Color colorCircular
  }) => ShapeDecoration(
  color: colorCircular,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radiusCircular)
  )
);

//Icons
const icNotification = "assets/icons/ic_notification.svg";