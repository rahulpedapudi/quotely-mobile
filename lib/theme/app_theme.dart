import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF080808),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFF0F0F0),
        onPrimary: Color(0xFF080808),
        secondary: Color(0xFFF0F0F0),
        onSecondary: Color(0xFF080808),
        surface: Color(0xFF121212),
        onSurface: Color(0xFFF0F0F0),
        error: Color(0xFFE57373),
        onError: Color(0xFF080808),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF0F0F0),
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFF0F0F0),
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFF0F0F0),
        ),
        labelMedium: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF080808),
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14,
          color: const Color(0xFFF0F0F0),
        ),
      ),
    );
  }
}
