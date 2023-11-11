import 'package:get/get.dart';
import 'package:todo/data/db/sqlite_manager.dart';
import 'package:todo/data/db/sqlite_manager_impl.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SQLiteManager>(
        () => SQLiteManagerImpl(),
      tag: (SQLiteManager).toString(),
      fenix: true
    );
  }

}