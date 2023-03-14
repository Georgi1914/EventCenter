import 'package:dio/dio.dart';

class Requests {
  final Dio _dio;

  Requests({required Dio dio}) : _dio = dio;

  Future getRequest(String url, {Map<String, String>? queryParams}) async {
    final Response response = await _dio.get(url, queryParameters: queryParams);
    return response.data;
  }

  Future<Response> postRequest(
    String url,
    Object? body, {
    Options? option,
    Map<String, String>? queryParams,
  }) async {
    final Response response = await _dio.post(
      url,
      options: option,
      data: body,
      queryParameters: queryParams,
    );
    return response;
  }

  Future putRequest(
    String url,
    Object? body, {
    Options? option,
    Map<String, String>? queryParams,
  }) async {
    final Response response = await _dio.put(
      url,
      options: option,
      data: body,
      queryParameters: queryParams,
    );
    return response;
  }
}
