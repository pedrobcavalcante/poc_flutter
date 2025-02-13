import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:poc_flutter/core/http/dio_client.dart';
import 'package:poc_flutter/features/posts/data/datasources/posts_datasource.dart';

class MockDioClient extends Mock implements DioClient {
  @override
  Dio get instance => Dio();
}

void main() {
  late PostsDatasourceImpl datasource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    datasource = PostsDatasourceImpl(mockDioClient);
  });

  group('getPosts', () {
    final tResponse = Response(
      data: [
        {
          'id': 1,
          'userId': 1,
          'title': 'Test Title',
          'body': 'Test Body',
        }
      ],
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

    test('should return list of posts when the call is successful', () async {
      when(() => mockDioClient.instance.get('/posts')).thenAnswer((_) async => tResponse);

      final result = await datasource.getPosts();

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.title, 'Test Title');
      verify(() => mockDioClient.instance.get('/posts')).called(1);
    });

    test('should throw exception when the call fails', () async {
      when(() => mockDioClient.instance.get('/posts')).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Error',
      ));

      expect(() => datasource.getPosts(), throwsException);
      verify(() => mockDioClient.instance.get('/posts')).called(1);
    });
  });

  group('getPostComments', () {
    final tResponse = Response(
      data: [
        {
          'id': 1,
          'postId': 1,
          'name': 'Test Name',
          'email': 'test@email.com',
          'body': 'Test Comment',
        }
      ],
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

    test('should return list of comments when the call is successful', () async {
      when(() => mockDioClient.instance.get('/posts/1/comments'))
          .thenAnswer((_) async => tResponse);

      final result = await datasource.getPostComments(1);

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.name, 'Test Name');
      verify(() => mockDioClient.instance.get('/posts/1/comments')).called(1);
    });

    test('should throw exception when the call fails', () async {
      when(() => mockDioClient.instance.get('/posts/1/comments')).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Error',
      ));

      expect(() => datasource.getPostComments(1), throwsException);
      verify(() => mockDioClient.instance.get('/posts/1/comments')).called(1);
    });
  });
} 