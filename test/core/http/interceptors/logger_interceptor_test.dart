import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_flutter/core/http/interceptors/logger_interceptor.dart';

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

void main() {
  late LoggerInterceptor interceptor;
  late MockRequestInterceptorHandler requestHandler;
  late MockResponseInterceptorHandler responseHandler;
  late MockErrorInterceptorHandler errorHandler;

  setUp(() {
    interceptor = LoggerInterceptor();
    requestHandler = MockRequestInterceptorHandler();
    responseHandler = MockResponseInterceptorHandler();
    errorHandler = MockErrorInterceptorHandler();
  });

  group('LoggerInterceptor', () {
    test('should log request data', () {
      final options = RequestOptions(
        path: '/test',
        method: 'GET',
        headers: {'Content-Type': 'application/json'},
        data: {'test': 'data'},
      );

      interceptor.onRequest(options, requestHandler);

      verify(() => requestHandler.next(options)).called(1);
    });

    test('should log response data', () {
      final response = Response(
        data: {'test': 'response'},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );

      interceptor.onResponse(response, responseHandler);

      verify(() => responseHandler.next(response)).called(1);
    });

    test('should log error data', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        error: 'Test error',
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );

      interceptor.onError(error, errorHandler);

      verify(() => errorHandler.next(error)).called(1);
    });
  });
}
