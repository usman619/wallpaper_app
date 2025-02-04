import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/themes/dark_mode.dart';
import 'package:wallpaper_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider() : _themeData = _getInitialTheme() {
    // Listen for system theme changes
    PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
      _updateTheme();
    };
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = isDarkMode ? lightMode : darkMode;
  }

  static ThemeData _getInitialTheme() {
    return PlatformDispatcher.instance.platformBrightness == Brightness.dark
        ? darkMode
        : lightMode;
  }

  void _updateTheme() {
    final newBrightness = PlatformDispatcher.instance.platformBrightness;
    themeData = (newBrightness == Brightness.dark) ? darkMode : lightMode;
  }
}
