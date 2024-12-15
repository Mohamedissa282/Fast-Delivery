import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
 static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
 static onTap (NotificationResponse notificationResponse) {
        
      }
 static Future init() async{
    InitializationSettings setings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );
      flutterLocalNotificationsPlugin.initialize(setings, onDidReceiveNotificationResponse:onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
      );
  }

  static void showBasicNotification(title , body)async{
    NotificationDetails details = NotificationDetails(android: AndroidNotificationDetails(
      'id 1', 'basic'));
 await flutterLocalNotificationsPlugin.show(0, title, body, details);
  }
}