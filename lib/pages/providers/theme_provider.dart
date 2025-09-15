import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeType { system, light, dark, custom }

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  AppThemeType _current = AppThemeType.system;

  ThemeMode get themeMode => _themeMode;
  AppThemeType get current => _current;

  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('app_theme_mode') ?? 'system';
    _current = AppThemeType.values.firstWhere(
      (e) => e.name == saved,
      orElse: () => AppThemeType.system,
    );
    switch (_current) {
      case AppThemeType.light:
        _themeMode = ThemeMode.light;
        break;
      case AppThemeType.dark:
        _themeMode = ThemeMode.dark;
        break;
      case AppThemeType.custom:
        _themeMode = ThemeMode.light;
        break;
      default:
        _themeMode = ThemeMode.system;
        break;
    }
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeType type) async {
    _current = type;
    switch (type) {
      case AppThemeType.light:
        _themeMode = ThemeMode.light;
        break;
      case AppThemeType.dark:
        _themeMode = ThemeMode.dark;
        break;
      case AppThemeType.custom:
        _themeMode = ThemeMode.light;
        break;
      default:
        _themeMode = ThemeMode.system;
        break;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_theme_mode', type.name);
    notifyListeners();
  }
}
