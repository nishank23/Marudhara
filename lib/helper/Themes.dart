import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff007EFF);
const greyColor = Color(0xffF5F5F5);
TextStyle get myRegularFont {
  return GoogleFonts.manrope(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ));
}

TextStyle get myMediumFont {
  return GoogleFonts.manrope(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ));
}

TextStyle get mySemiBold {
  return GoogleFonts.manrope(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ));
}
