import 'dart:convert';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationUtil {

  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  requestPermission() async {
    try {
      if (Platform.isAndroid) {
        var result = await notificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .requestNotificationsPermission();
        return result;
      } else {
        var result = await notificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()!
            .requestPermissions(
                sound: true, alert: true, critical: true, badge: true);
        return result;
      }
    } on Exception catch (e) {
      return false;
    }
  }

  initialize() {
    notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(''),
        iOS: DarwinInitializationSettings(
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentBanner: true,
          defaultPresentSound: true,
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
      ),
      onDidReceiveBackgroundNotificationResponse: (details) {},
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  showNotification(
      {required String title, required String body, dynamic data}) {
    notificationsPlugin.show(
        9001,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            '12002',
            "ez book notifications",
            priority: Priority.max,
            importance: Importance.max,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        payload: jsonEncode(data));
  }
}
