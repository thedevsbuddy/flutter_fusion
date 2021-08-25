import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final _theme = "system".obs;
  final storage = GetStorage();
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => _theme.value;

  @override
  onInit() {
    assignThemeMode();
    super.onInit();
  }

  Future<void> assignThemeMode() async {
    var theme = await storage.read('theme');
    if (theme != null) {
      _theme(theme);
      _themeMode = getThemeModeFromString(theme);
      Get.changeThemeMode(_themeMode);
    }
    update();
  }

  Future<void> setThemeMode(String value) async {
    _theme(value);
    _themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(_themeMode);
    await storage.write('theme', value);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (themeString == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  getThemeModeFromStore() async {
    String _themeString = storage.read('theme') ?? 'system';
    setThemeMode(_themeString);
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance!.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }
}
