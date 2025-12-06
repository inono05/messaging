import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:messaging/src/features/chat/data/adapters/hive_adapter_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../firebase_options.dart';
import '../../../config/theme/data/datasources/theme_preferences.dart';
import '../../../core/data/datasource/local/hive_db.dart';
import '../../../core/notifications/app_firebase_messaging.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {});
  // await for all initialization code to be complete before returning
  await HiveDB.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppFirebaseMessaging().init();
  await WebViewCookieManager().platform.clearCookies();
  Hive.registerAdapter(HiveAdapterMessage());
  await AppThemePreferences.ensureInitialized();
}
