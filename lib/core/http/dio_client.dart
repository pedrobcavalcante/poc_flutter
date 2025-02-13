import 'package:dio/dio.dart';

import 'interceptors/logger_interceptor.dart';
import 'validators/status_validator.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        contentType: 'application/json',
        validateStatus: StatusValidator.validate,
      ),
    )..interceptors.addAll([
        LoggerInterceptor(),
      ]);
  }

  Dio get instance => _dio;
}
