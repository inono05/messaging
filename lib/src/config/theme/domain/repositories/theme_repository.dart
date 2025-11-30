import '../entities/theme_mode_entity.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> setThemeMode(AppThemeMode mode);
}