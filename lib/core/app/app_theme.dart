import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF08C952),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF08C952),
      onSecondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF160440),
      onTertiary: Color(0xFFFFFFFF),
      surface: Color(0xFF020C06),
      surfaceTint: Color(0xFF08C952),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF08C952),
      onPrimary: Color(0xFF020C06),
      secondary: Color(0xFF08C952),
      onSecondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF160440),
      onTertiary: Color(0xFFFFFFFF),
      surfaceTint: Color(0xFFFFFFFF),
    ),
  );
}
