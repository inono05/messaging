import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:messaging/src/features/dashboard/data/models/server.dart';

class ServerController extends StateNotifier<Server> {
  final String serverUrl;
  Timer? _timer;
  int _retrySeconds = 2;

  ServerController(this.serverUrl) : super(Server(available: true));

  Future<void> _checkServerAvailability() async {
    try {
      final response = await http
          .get(Uri.parse(serverUrl))
          .timeout(Duration(seconds: _retrySeconds));

      state = (response.statusCode == 200)
          ? Server(available: true)
          : state = Server(available: false);

      _retrySeconds = 2;
      _planNextChecking(5);
    } catch (e) {
      state = Server(available: false);
      _planNextChecking(_retrySeconds);
      _retrySeconds = (_retrySeconds * 2).clamp(2, 30);
    }
  }

  void _planNextChecking(int seconds) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: seconds), _checkServerAvailability);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
