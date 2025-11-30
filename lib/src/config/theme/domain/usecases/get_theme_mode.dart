import '../entities/theme_mode_entity.dart';
import '../repositories/theme_repository.dart';

class GetThemeMode {
  final ThemeRepository repository;
  GetThemeMode(this.repository);

  Future<AppThemeMode> call() => repository.getThemeMode();
}
