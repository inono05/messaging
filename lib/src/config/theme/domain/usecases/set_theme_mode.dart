import '../entities/theme_mode_entity.dart';
import '../repositories/theme_repository.dart';

class SetThemeMode {
  final ThemeRepository repository;
  SetThemeMode(this.repository);

  Future<void> call(AppThemeMode mode) => repository.setThemeMode(mode);
}