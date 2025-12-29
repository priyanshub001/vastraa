import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.yellow,



    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.white,
      elevation: 4,
    ),

    textTheme: TextTheme(
      // for big heading or banner...
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),

      // for app bar or screen title ...
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),

      //section heading..
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),

      // normal paragraph text..
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),

      // Default text ...
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),

      // small text or hint or caption...
      bodySmall: TextStyle(fontSize: 12, color: Colors.black54),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    primaryColor: Colors.yellow,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
    ),

    textTheme: TextTheme(
      // Default text ...
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
