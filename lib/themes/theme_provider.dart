import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/themes/dark_mode.dart';
import 'package:wallpaper_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  int _selectedThemeIndex = 0; // 0: System, 1: Light, 2: Dark

  ThemeProvider() : _themeData = _getInitialTheme() {
    // Listen for system theme changes when in "System" mode.
    PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
      if (_selectedThemeIndex == 0) {
        _updateTheme();
      }
    };
  }

  ThemeData get themeData => _themeData;
  int get selectedThemeIndex => _selectedThemeIndex;

  /// Sets the theme based on the provided index.
  /// index: 0 = System, 1 = Light, 2 = Dark.
  void setTheme(int index) {
    _selectedThemeIndex = index;
    if (index == 0) {
      // Use the system brightness.
      _updateTheme();
    } else if (index == 1) {
      _themeData = lightMode;
      notifyListeners();
    } else if (index == 2) {
      _themeData = darkMode;
      notifyListeners();
    }
  }

  static ThemeData _getInitialTheme() {
    return PlatformDispatcher.instance.platformBrightness == Brightness.dark
        ? darkMode
        : lightMode;
  }

  void _updateTheme() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    _themeData = brightness == Brightness.dark ? darkMode : lightMode;
    notifyListeners();
  }
}
