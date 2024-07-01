
import 'package:dio/dio.dart';

abstract class IDioHttpClient extends Interceptor{
  Future<dynamic> post(String url, Map<String,dynamic> data,Map<String, dynamic>? queryParameters,Options options);
  Future<dynamic> get(String url, Map<String, dynamic>? queryParameters,List<Map<String, dynamic>?> data,Options? options);
  Future<dynamic> put(String url, Map<String, dynamic> data,Map<String, dynamic>? queryParameters);
  Future<dynamic> delete(String url, Map<String, dynamic> data,Map<String, dynamic>? queryParameters);
  Future<dynamic> patch(String url, Map<String, dynamic> data,Map<String, dynamic>? queryParameters);

}