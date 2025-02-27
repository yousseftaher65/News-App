import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  changeTheme(newTheme) {
    _themeMode = newTheme;
    notifyListeners();
  }
}
