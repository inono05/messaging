import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/theme/data/datasources/theme_preferences.dart';
import '../../../core/data/datasource/local/hive_db.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
    //ref.invalidate(apiProvider);
    //ref.invalidate(entryRepositoryProvider);
  });
  // await for all initialization code to be complete before returning
  await HiveDB.ensureInitialized();
  //await UserPreferenceService.ensureInitialized();
  await AppThemePreferences.ensureInitialized();
  //await ref.watch(entryRepositoryProvider.future);
}
