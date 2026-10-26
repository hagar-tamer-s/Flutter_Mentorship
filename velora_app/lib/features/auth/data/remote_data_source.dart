import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:velora_app/core/utils/app_shared_preferences.dart';
import 'package:velora_app/features/auth/data/models/messages_model.dart';
import 'package:velora_app/features/auth/data/models/tokens_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();

  Future<TokensModel> logIn(
    String email,
    String pass,
    bool isRemembered,
  ) async {
    try {
      var response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/login",
        data: {"email": email, "password": pass},
      );
      TokensModel tokens = TokensModel.fromJson(response.data);
      await AppPreferences().setData('token', tokens.accessToken);

      await AppPreferences().setData('remember_me', isRemembered);

      await AppPreferences().setData('saved_email', email);
      await AppPreferences().setData('saved_password', pass);
      return tokens;
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['errors']['generalErrors'] ?? 'Error.......';

      throw Exception(errorMessage);
    }
  }

  Future<void> signUp(
    String email,
    String pass,
    String firstName,
    String lastName,
  ) async {
    try {
      var response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/register",
        data: {
          "email": email,
          "password": pass,
          "firstName": firstName,
          "lastName": lastName,
        },
      );
      log(response.data.toString());
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['errors']['generalErrors'] ?? 'Error.......';

      throw Exception(errorMessage);
    }
  }

  Future<void> verifyEmail(String email, String otp) async {
    try {
      var response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/verify-email",
        data: {"email": email, "otp": otp},
      );
      log(response.data.toString());
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['errors']['message'] ?? 'Error.......';

      throw Exception(errorMessage);
    }
  }

  Future<MessagesModel> resendOTP(String email) async {
    try {
      var response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/resend-otp",
        data: {"email": email},
      );

      return MessagesModel(message: response.data);
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['errors']['message'] ?? 'Error.......';

      throw Exception(errorMessage);
    }
  }
}
