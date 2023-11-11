import 'package:get/get.dart';
import 'package:todo/view/login_page/login_controller.dart';

class LoginBinding  extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
       () => LoginController()
    );
  }
}