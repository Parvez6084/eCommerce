import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:todo/services/local_notification.dart';

class FirebaseService extends GetxService{

  final FirebaseMessaging _fcmMessaging = FirebaseMessaging.instance;


  @override
  void onInit() {
    super.onInit();
    fcmNotification();
  }

  void fcmNotification()async{


    await _fcmMessaging.requestPermission(
      alert: true, announcement: true, badge: true,
      criticalAlert: true, provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    var fcmToken = _fcmMessaging.getToken();
    print(fcmToken);

    RemoteMessage? initMessage = await _fcmMessaging.getInitialMessage();

    if(initMessage != null){_fcmListener;}

    FirebaseMessaging.onMessage.listen(_fcmListener);

    FirebaseMessaging.onMessageOpenedApp.listen(_fcmListener);

    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);

  }

  void _fcmListener(RemoteMessage message){
    if(message.notification != null){
      String title = message.notification!.title!;
      String body = message.notification!.body!;
      LocalNotificationService.loadNotification(title: title,  body: body);
    }
  }

}


@pragma('vm:entry-point')
Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if(message.notification != null){
    String title = message.notification!.title!;
    String body = message.notification!.body!;
    LocalNotificationService.loadNotification(title: title,  body: body);
  }
}