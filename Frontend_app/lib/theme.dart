import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.amber,



    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      elevation: 4,
    ),

    cardColor: Colors.white,


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
        fontWeight: FontWeight.bold,
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
    scaffoldBackgroundColor: const Color(0xFF121212),

    primaryColor: const Color(0xFFFFC107),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFC107),
      foregroundColor: Colors.white,
      elevation: 0,
    ),


    cardColor: const Color(0xFF1E1E1E),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white60),
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
