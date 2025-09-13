import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF5a3938),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF5a3938),
      secondary: Color(0xFFdfa49b),
      background: Color(0xFFa3ab98),
      surface: Color(0xFF847b6d),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.black,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5a3938),
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFdfa49b),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5a3938),
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF847b6d)),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF5a3938),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF5a3938),
      secondary: Color(0xFFdfa49b),
      background: Color(0xFF847b6d),
      surface: Color(0xFFa3ab98),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5a3938),
      foregroundColor: Colors.white,
    ),
  );
}
