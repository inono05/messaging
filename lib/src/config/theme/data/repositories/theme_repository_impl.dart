
import '../../domain/entities/theme_mode_entity.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final AppThemePreferences themePreferences;
   ThemeRepositoryImpl(this.themePreferences);
  @override
  Future<AppThemeMode> getThemeMode() async{
    // TODO: implement getThemeMode
    return themePreferences.getThemeMode();
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) async{
    // TODO: implement setThemeMode
    await themePreferences.setThemeMode(mode);
  }

}