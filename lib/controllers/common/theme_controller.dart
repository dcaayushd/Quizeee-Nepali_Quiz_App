import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizieee/configs/configs.dart';
import 'package:quizieee/utils/logger.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  Future<void> initializeThemeData() async {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightheme = lightheme().buildlightheme();
  }

  ThemeData getDarkTheme() {
    return _darkTheme;
  }

  ThemeData getlightheme() {
    return _lightheme;
  }

  void changeTheme() {
    AppLogger.i('Is Dark theme - ${Get.isDarkMode}');
    Get.changeTheme(Get.isDarkMode ? _lightheme : _darkTheme);
  }
}
