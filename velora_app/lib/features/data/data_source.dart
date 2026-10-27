import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:velora_app/core/network/dio_helper.dart';
import 'package:velora_app/features/data/model/category_model.dart';
import 'package:velora_app/features/data/model/product_model.dart';

class DataSource {
  Future<List<ProductModel>> getProducts() async {
    try {
      var response = await DioHelper.dio.get(
        "api/products",
        data: {
          "searchTerm": null,
          "category": null,
          "minPrice": null,
          "maxPrice": null,
          "isInStock": null,
          "sortBy": null,
          "sortOrder": null,
          "page": 1,
          "pageSize": 10,
        },
      );
      List<ProductModel> products = [];
      for (var element in response.data["items"]) {
        ProductModel product = ProductModel.fromJson(element);
        products.add(product);
      }
      return products;
    } on DioException catch (e) {
      log("Server Error Response for Products: ${e.response?.data}");
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await DioHelper.dio.get("api/categories");
      List<CategoryModel> categories = [];
      for (var element in response.data["categories"]) {
        CategoryModel category = CategoryModel.fromJson(element);
        categories.add(category);
      }
      return categories;
    } catch (e) {
      throw Exception(e);
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

  Future<void> deleteProduct(String id) async {
    try {
      await DioHelper.dio.delete("api/products/$id");
      log("Product with id: {$id} is deleted");
    } catch (e) {
      throw Exception(e);
    }
  }
}
