import 'package:dio/dio.dart';

import 'local_storage.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _storage;

  AuthInterceptor({required LocalStorage storage}) : _storage = storage;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await _storage.getToken();
    if (token != null) {
      options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.message.toString());
  }
}
