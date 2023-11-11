import 'package:get/get.dart';
import 'package:todo/view/home_page/home_controller.dart';

class HomeBinding  extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
       () => HomeController()
    );
  }
}