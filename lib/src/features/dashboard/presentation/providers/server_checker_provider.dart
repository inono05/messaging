import 'package:flutter_riverpod/legacy.dart';
import 'package:messaging/src/shared/shared.dart';

import '../../data/models/server.dart';
import '../controllers/server_controller.dart';

final serverCheckerProvider = StateNotifierProvider<ServerController, Server>((ref) {
  return ServerController(AppConstants.webUrl);
});

final webViewErrorProvider = StateProvider<bool>((ref) => false);
