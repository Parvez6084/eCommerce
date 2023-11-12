import 'package:get/get.dart';
import 'package:todo/data/db/sqlite_manager.dart';
import 'package:todo/data/db/sqlite_manager_impl.dart';
import 'package:todo/services/fcm.dart';
import 'package:todo/services/local_notification.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SQLiteManager>(
        () => SQLiteManagerImpl(),
      tag: (SQLiteManager).toString(),
      fenix: true
    );

    Get.putAsync(() async => LocalNotificationService(),
        tag: (LocalNotificationService).toString(),
        permanent: true
    );

    Get.putAsync(() async => FirebaseService(),
        tag: (FirebaseService).toString(),
        permanent: true
    );

  }
}