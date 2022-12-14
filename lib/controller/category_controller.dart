import 'package:fake_store_app/service/remote_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = [].obs;
  var isLoading = false.obs;
  Future getCategories() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchCategories();
      if (data != null) {
        categories.value = data;
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
    getCategories();
  }
}
