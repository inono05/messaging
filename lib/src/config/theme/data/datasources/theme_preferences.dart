import 'package:hive/hive.dart';

import '../../../../core/data/datasource/local/hive_db.dart';
import '../../domain/entities/theme_mode_entity.dart';
const String themeBoxName = 'themeBox';
const String themeKey = 'themeMode';
class AppThemePreferences {
  static AppThemePreferences? _instance;
  static Box? _box;

  factory AppThemePreferences() {
    if (_instance == null) {
      throw Exception('Theme preference is not initialized. '
          'Please call AppThemePreferences.ensureInitialized before.');
    }
    return _instance!;
  }

  const AppThemePreferences._();

  static Future<void> ensureInitialized() async {
    _box = await HiveDB.openBox(themeBoxName);
    _instance ??= const AppThemePreferences._();
  }


  AppThemeMode getThemeMode() {
    final value = _box!.get(themeKey, defaultValue: AppThemeMode.system.index);
    if (value == null) return AppThemeMode.system;

    return AppThemeMode.values[value];
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    await _box!.put(themeKey, mode.index);
  }
}