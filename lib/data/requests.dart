import 'package:dio/dio.dart';

class Requests {
  final Dio _dio;

  Requests({required dio}) : _dio = dio;

  Future getRequest(String url) async {
    final Response response = await _dio.get(url);
    return response.data;
  }

  Future<Response> postRequest(
    String url,
    Object? body, {
    Options? option,
  }) async {
    final Response response = await _dio.post(
      url,
      options: option,
      data: body,
    );
    return response;
  }
}
