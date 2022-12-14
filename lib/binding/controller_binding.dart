import 'package:fake_store_app/controller/category_controller.dart';
import 'package:fake_store_app/controller/producr_controller.dart';
import 'package:get/get.dart';

class ControllerBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(ProductController());
  }
}
