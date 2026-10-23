import 'package:dio/dio.dart';
import 'package:velora_app/core/utils/app_shared_preferences.dart';
import 'package:velora_app/features/data/model/category_model.dart';
import 'package:velora_app/features/data/model/product_model.dart';

class DataSource {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    try {
      var response = await dio.get(
        "https://accessories-eshop.runasp.net/api/products",
      );
      List<ProductModel> products = [];
      for (var element in response.data["items"]) {
        ProductModel product = ProductModel.fromJson(element);
        products.add(product);
      }
      return products;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  final String? token = AppPreferences().getData('token');

  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await dio.get(
        "https://accessories-eshop.runasp.net/api/categories",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      List<CategoryModel> categories = [];
      for (var element in response.data["categories"]) {
        CategoryModel category = CategoryModel.fromJson(element);
        categories.add(category);
      }

      return categories;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }

    // try {
    //   var response = await dio.get(
    //     "https://accessories-eshop.runasp.net/api/categories",
    //   );
    //   return response.data["categories"];
    // } on DioException catch (e) {
    //   log(e.error.toString());
    //   throw (Exception);
    // } catch (e) {
    //   rethrow;
    // }
  }
}
