import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../main.dart';
import '../shared.dart';

class AppHelpers {
  static void toast(BuildContext context, String message, {bool isSuccess = false}) {
    isSuccess
        ? CherryToast.success(
            title: Text(message, style: context.hLarge),
            borderRadius: AppSize.p8,
            backgroundColor: context.surface,
          ).show(context)
        : CherryToast.error(
            title: Text(message, style: context.hLarge),
            borderRadius: AppSize.p8,
            backgroundColor: context.surface,
          ).show(context);
  }

  static Future<void> inAppMessagingSetup() async {
    final inAppNotification = FlutterLocalNotificationsPlugin();
    final androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    await inAppNotification.initialize(InitializationSettings(android: androidSettings));
  }

  static void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return debugPrint('permission ==> User granted ');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      return debugPrint('permission ==> User granted provisional permission.');
    } else {
      return debugPrint('permission ==> User declined permission. ');
    }
  }

  static Future<void> getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('*************************************************');
    debugPrint('DeviceToken ==> $token');
    debugPrint('*************************************************');
  }

  static void initializeNotifications() {
    const android = AndroidInitializationSettings('@mipmap/launcher_icon');
    const ios = DarwinInitializationSettings();
    const initializeSettings = InitializationSettings(android: android, iOS: ios);
    notificationsLocale.initialize(
      initializeSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {},
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("foreground msg ==> ${message.messageId}");
      AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        "MESSAGING",
        "MESSAGING",
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      );
      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: const DarwinNotificationDetails(),
      );
      await notificationsLocale.show(
        0,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: message.data['title'],
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint("foreground2 msg ==> ${message.messageId}");
    });
  }
}
