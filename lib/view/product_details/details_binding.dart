import 'package:get/get.dart';
import 'package:todo/view/product_details/details_controller.dart';

class DetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
            () => DetailsController()
    );
  }

}