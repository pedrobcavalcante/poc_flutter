import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Adiciona token de autenticação se necessário
    final token = 'seu-token-aqui';
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Trata erros de autenticação (401)
    if (err.response?.statusCode == 401) {
      // Implementar refresh token ou logout
    }
    handler.next(err);
  }
}
