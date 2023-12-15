import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final TextStyle kUzbekistanETxtStyle = GoogleFonts.akayaTelivigala(
    color: Colors.white,
    fontSize: 70,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle kPlanTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle kHistoricalTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 45,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle kExploreTextStyle =
  TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400);
  static final TextStyle kUzbTextStyle = GoogleFonts.akayaTelivigala(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle kTitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kDescriptionTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500);
}
