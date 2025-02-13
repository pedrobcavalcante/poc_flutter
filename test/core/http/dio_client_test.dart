import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter/core/http/dio_client.dart';
import 'package:poc_flutter/core/http/interceptors/logger_interceptor.dart';
import 'package:poc_flutter/core/http/interceptors/auth_interceptor.dart';

void main() {
  late DioClient dioClient;

  setUp(() {
    dioClient = DioClient();
  });

  group('DioClient', () {
    test('should create Dio instance with correct base configuration', () {
      final dio = dioClient.instance;

      expect(dio.options.baseUrl, 'https://jsonplaceholder.typicode.com');
      expect(dio.options.connectTimeout, const Duration(seconds: 5));
      expect(dio.options.receiveTimeout, const Duration(seconds: 3));
      expect(dio.options.contentType, 'application/json');
    });

    test('should have logger interceptor', () {
      final dio = dioClient.instance;

      expect(dio.interceptors.length, 2);
      expect(dio.interceptors.any((i) => i is LoggerInterceptor), true);
    });

    test('should validate status correctly', () {
      final dio = dioClient.instance;

      expect(dio.options.validateStatus(200), true);
      expect(dio.options.validateStatus(404), true);
      expect(dio.options.validateStatus(401), false);
      expect(dio.options.validateStatus(500), false);
    });
  });
}
