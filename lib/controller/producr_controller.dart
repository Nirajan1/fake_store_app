import 'package:fake_store_app/service/remote_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = [].obs;
  var isLoading = false.obs;
  Future getProducts() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchProducts();
      if (data != null) {
        products.value = data;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
}
