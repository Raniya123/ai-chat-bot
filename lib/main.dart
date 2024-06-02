import 'package:ai_chat_bot/config.dart';
import 'package:ai_chat_bot/controller/theme_controller.dart';
import 'package:ai_chat_bot/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

void main() {
  Gemini.init(apiKey: Config.apiToken);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Config.appName,
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: themeController.themeMode,
      home: HomeView(),
    );
  }
}
