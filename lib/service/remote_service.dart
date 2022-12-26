import 'package:fake_store_app/model/category_model.dart';
import 'package:fake_store_app/model/product_model.dart';
import 'package:fake_store_app/model/single_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();
  static Future<List<String>?> fetchCategories() async {
    try {
      var response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productsCategoryFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    return null;
  }

  static Future<List<AllProductList>?> fetchProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return allProductListFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    return null;
  }

  //fetch singleProduct model
  static Future<SingleProductModel?> fetchSingleProduct(int id) async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return singleProductModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    return null;
  }
}
