import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:messaging/src/core/notifications/providers/fcm_provider.dart';

class PushState {
  final String? token;
  final RemoteMessage? openedMessage;

  PushState({this.openedMessage, this.token});

  PushState copyWith({String? token, RemoteMessage? openedMessage}) {
    return PushState(
      token: token ?? this.token,
      openedMessage: openedMessage ?? this.openedMessage,
    );
  }
}

class PushNotifier extends StateNotifier<PushState> {
  final FirebaseMessaging messaging;
  final FlutterLocalNotificationsPlugin inAppNotifications;

  PushNotifier(this.messaging, this.inAppNotifications) : super(PushState());

  Future<void> initialize() async {
    //permissions
    await messaging.requestPermission(alert: true, badge: true, sound: true);
    //get the device token
    final token = await messaging.getToken();
    state = state.copyWith(token: token);
    log(token!);

    //set foreground notifications
    FirebaseMessaging.onMessage.listen((value) => _showInAppNotification(value));

    // background notification (open app)
    FirebaseMessaging.onMessageOpenedApp.listen((value) {
      state = state.copyWith(openedMessage: value);
    });

    final message = await messaging.getInitialMessage();
    if (message != null) state = state.copyWith(openedMessage: message);
  }

  Future<void> _showInAppNotification(RemoteMessage message) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'MESSAGING',
        importance: Importance.max,
        priority: Priority.max,
      ),
    );

    await inAppNotifications.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      details,
      payload: message.data.toString(),
    );
  }
}

final fcmNotifierProvider = StateNotifierProvider<PushNotifier, PushState>((ref) {
  final messaging = ref.watch(fcmProvider);
  final inAppMessaging = FlutterLocalNotificationsPlugin();
  return PushNotifier(messaging, inAppMessaging);
});
