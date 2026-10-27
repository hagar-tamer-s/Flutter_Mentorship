import 'package:dio/dio.dart';
import 'package:velora_app/core/utils/app_shared_preferences.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = AppPreferences().getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = AppPreferences().getRefreshToken();

      if (refreshToken == null) {
        await _redirectToLogin();
        return handler.next(err);
      }

      try {
        final refreshDio = Dio(BaseOptions(baseUrl: dio.options.baseUrl));

        final response = await refreshDio.post(
          'https://accessories-eshop.runasp.net/api/auth/refresh-token',
          data: {'refresh_token': refreshToken, 'useCookies': false},
        );

        if (response.statusCode == 200) {
          final newAccessToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];

          await AppPreferences().saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken ?? refreshToken,
          );

          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';

          final clonedRequest = await dio.fetch(err.requestOptions);
          return handler.resolve(clonedRequest);
        }
      } catch (e) {
        await AppPreferences().clearTokens();
        await _redirectToLogin();
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  Future<void> _redirectToLogin() async {}
}
