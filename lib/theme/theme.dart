import 'package:flutter/material.dart';

class AppThemes {
  static Color headerBgColor = Colors.white;
  static Color greenColor = const Color(0xFF69B409);
  static Color orgColor = const Color(0xFFFF9900);
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF0F0F0),
    primaryColor: const Color(0xFF69B409),
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF69B409),
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );

  static AppBar mainAppBar(String title) {
    return AppBar(
      backgroundColor: AppThemes.headerBgColor,
      centerTitle: false,
      title: Text(title),
    );
  }
}
