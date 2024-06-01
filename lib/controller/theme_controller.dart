import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme.dart';

class ThemeController extends GetxController {
  // Initial theme mode
  var isDarkMode = false.obs;

  ThemeMode get themeMode =>
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData get lightTheme => AppThemes.lightTheme;

  ThemeData get darkTheme => AppThemes.darkTheme;
}
