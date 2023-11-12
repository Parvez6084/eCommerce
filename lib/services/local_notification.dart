import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService extends GetxService{

  static final _notificationPlugin = FlutterLocalNotificationsPlugin();

  static void notificationInitialize(){
    var initAndroidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initIOSSettings = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false
    );
    var initSettings = InitializationSettings(
        android: initAndroidSettings,
        iOS: initIOSSettings
    );
    _notificationPlugin.initialize(initSettings);
  }

  @override
  void onInit() {
    super.onInit();
    notificationInitialize();
  }

  static void loadNotification({required String title, body})async{
    try{
      final id = DateTime.now().microsecondsSinceEpoch ~/10;
      NotificationDetails notificationDetails = const NotificationDetails(
          android:  AndroidNotificationDetails(
              '111',
              'notification',
              importance: Importance.max,
              priority: Priority.high
          )
      );
      await _notificationPlugin.show(3, title, body, notificationDetails);
    } on Exception catch (error){throw error.toString();}

  }




}