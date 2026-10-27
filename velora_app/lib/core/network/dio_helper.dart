import 'package:dio/dio.dart';

import 'auth_interceptor.dart'; // مسار الـ Interceptor بتاعك

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://accessories-eshop.runasp.net/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(AuthInterceptor(dio));

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
