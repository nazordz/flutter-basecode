import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyle {
  TextTheme textThemeStyle() {
    return TextTheme(
        titleLarge: GoogleFonts.poppins(
            textStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        )),
        titleMedium: GoogleFonts.poppins(
            textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )),
        bodyLarge: GoogleFonts.poppins(
            textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        )),
        bodyMedium: GoogleFonts.poppins(
            textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        )));
  }
}
