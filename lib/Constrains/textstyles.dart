import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary Text Style
TextStyle PrimaryTextStyle() {
  return TextStyle(
    color: Color(0xFF232323),
    fontSize: 14,
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.w600,
    height: 1.83,
  );
}

// Headings Text Styles
TextStyle HeadingTextStyle1() {
  return TextStyle(
    color: const Color(0xFF232323),
    fontSize: 22,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w700,
    height: 3.25,
  );
}

TextStyle HeadingTextStyle2() {
  return TextStyle(
    color: Color(0xFF232323),
    fontSize: 20,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w600,
    height: 0.20,
  );
}

TextStyle HeadingTextStyle3() {
  return TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.w600,
    height: 0.20,
  );
}
// Paragraph Text Styles

TextStyle ParaTextStyle1() {
  return TextStyle(
    color: Color(0xFF636363),
    fontSize: 16,
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.60,
  );
}

// TextField Labels Text Style
TextStyle LabelTextStyle1() {
  return TextStyle(
    color: Color(0xFF636363),
    fontSize: 16,
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.w600,
    height: 1.60,
  );
}

TextStyle LabelTextStyle2() {
  return TextStyle(
    color: Color(0xFF636363),
    fontSize: 12,
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.w400,
    height: 0.18,
  );
}
