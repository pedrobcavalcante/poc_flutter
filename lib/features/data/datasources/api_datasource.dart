import 'package:dio/dio.dart';
import 'package:poc_flutter/core/http/dio_client.dart';

abstract class IApiDatasource {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data});
}

class ApiDatasource implements IApiDatasource {
  final Dio _dio;

  ApiDatasource({Dio? dio}) : _dio = dio ?? DioClient().instance;

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      print(e);
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      print(e);
    }
  }
}
