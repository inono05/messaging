import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../data/datasources/theme_preferences.dart';
import '../data/repositories/theme_repository_impl.dart';
import '../domain/entities/theme_mode_entity.dart';
import '../domain/usecases/get_theme_mode.dart';
import '../domain/usecases/set_theme_mode.dart';

final themeNotifierProvider =
StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  final getTheme = ref.watch(getThemeModeProvider);
  final setTheme = ref.watch(setThemeModeProvider);
  return ThemeNotifier(getTheme, setTheme);
});

final themeRepositoryProvider = Provider((ref) {
    return ThemeRepositoryImpl(AppThemePreferences());
});

final getThemeModeProvider = Provider((ref) {
  return GetThemeMode(ref.watch(themeRepositoryProvider));
});

final setThemeModeProvider = Provider((ref) {
  return SetThemeMode(ref.watch(themeRepositoryProvider));
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final GetThemeMode _getThemeMode;
  final SetThemeMode _setThemeMode;

  ThemeNotifier(this._getThemeMode, this._setThemeMode)
      : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final mode = await _getThemeMode();
    state = _mapAppThemeMode(mode);
  }

  Future<void> setTheme(AppThemeMode mode) async {
    await _setThemeMode(mode);
    state = _mapAppThemeMode(mode);
  }

  ThemeMode _mapAppThemeMode(AppThemeMode appMode) {
    switch (appMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}