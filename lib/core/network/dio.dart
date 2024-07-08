import 'dart:async';

import 'package:contact_manger/core/error_handling/check_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'a_dio_http_client.dart';

class DioHttpClient extends IDioHttpClient {
  final Dio dio;

  DioHttpClient({
    required this.dio,
  }) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  @override
  Future<dynamic> post(String url, Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters, Options? options) async {
    final response = await dio
        .post(url, data: data, queryParameters: queryParameters)
        .onError((DioException error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

  // GET Request
  @override
  Future<dynamic> get(String url, Map<String, dynamic>? queryParameters,
      List<Map<String, dynamic>?> data, Options? options) async {
    final response = await dio
        .get(
      url,
      queryParameters: queryParameters,
      options: options,
    ).onError((DioException error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

  // PUT Request
  @override
  Future<dynamic> put(String url, Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters) async {
    final response = await dio
        .put(
      url,
      data: data,
      queryParameters: queryParameters,
    )
        .onError((DioException error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

  // DELETE Request
  @override
  Future<dynamic> delete(String url, Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters) async {
    Response response = await dio
        .delete(url, data: data, queryParameters: queryParameters)
        .onError((DioException error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

  // PATCH Request
  @override
  Future<dynamic> patch(String url, Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters) async {
    Response response = await dio
        .patch(url, data: data, queryParameters: queryParameters)
        .onError((DioException error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

}
