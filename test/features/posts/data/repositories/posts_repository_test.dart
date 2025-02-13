import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_flutter/features/posts/data/datasources/posts_datasource.dart';
import 'package:poc_flutter/features/posts/data/repositories/posts_repository.dart';
import 'package:poc_flutter/features/posts/domain/models/post_model.dart';
import 'package:poc_flutter/features/posts/domain/models/comment_model.dart';

class MockPostsDatasource extends Mock implements PostsDatasource {}

void main() {
  late PostsRepository repository;
  late MockPostsDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockPostsDatasource();
    repository = PostsRepository(mockDatasource);
  });

  group('getPosts', () {
    final tPosts = [
      PostModel(id: 1, title: 'Test', body: 'Test body', userId: 1),
    ];

    test('should return posts when datasource succeeds', () async {
      when(() => mockDatasource.getPosts()).thenAnswer((_) async => tPosts);

      final result = await repository.getPosts();

      expect(result, equals(tPosts));
      verify(() => mockDatasource.getPosts()).called(1);
    });

    test('should throw Exception when datasource fails', () async {
      when(() => mockDatasource.getPosts()).thenThrow(Exception());

      final call = repository.getPosts;

      expect(call, throwsA(isA<Exception>()));
      verify(() => mockDatasource.getPosts()).called(1);
    });
  });

  group('getPostComments', () {
    final tComments = [
      CommentModel(
        id: 1,
        postId: 1,
        name: 'Test',
        email: 'test@test.com',
        body: 'Test comment',
      ),
    ];

    test('should return comments when datasource succeeds', () async {
      when(() => mockDatasource.getPostComments(any()))
          .thenAnswer((_) async => tComments);

      final result = await repository.getPostComments(1);

      expect(result, equals(tComments));
      verify(() => mockDatasource.getPostComments(1)).called(1);
    });

    test('should throw Exception when datasource fails', () async {
      when(() => mockDatasource.getPostComments(any())).thenThrow(Exception());

      final call = () => repository.getPostComments(1);

      expect(call, throwsA(isA<Exception>()));
      verify(() => mockDatasource.getPostComments(1)).called(1);
    });
  });
} 