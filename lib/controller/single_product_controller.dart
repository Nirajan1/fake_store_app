import 'package:fake_store_app/model/single_product_model.dart';
import 'package:fake_store_app/service/remote_service.dart';
import 'package:get/get.dart';

class SingleProductConroller extends GetxController {
  var product = SingleProductModel().obs;
  var isLoading = false.obs;
  Future getProduct(int id) async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchSingleProduct(id);
      if (data != null) {
        product.value = data;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
