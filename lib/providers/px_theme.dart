import 'package:flutter/material.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

class PxTheme extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  void switchTheme(BuildContext context) {
    _mode == ThemeMode.light ? _mode = ThemeMode.dark : _mode = ThemeMode.light;
    notifyListeners();
  }

  ThemeData _light =
      ThemeData.from(colorScheme: randomColorScheme(isDark: false));
  ThemeData get lightTheme => _light;
  ThemeData _dark =
      ThemeData.from(colorScheme: randomColorScheme(isDark: true));
  ThemeData get darkTheme => _dark;

  void refreshThemes() {
    _light = ThemeData.from(colorScheme: randomColorScheme(isDark: false));
    _dark = ThemeData.from(colorScheme: randomColorScheme(isDark: true));
    notifyListeners();
  }

  //TODO: implement saving user prefered theme data to be loaded on request
}
