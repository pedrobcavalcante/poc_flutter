import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_flutter/features/posts/data/repositories/posts_repository.dart';
import 'package:poc_flutter/features/posts/domain/models/post_model.dart';
import 'package:poc_flutter/features/posts/domain/models/comment_model.dart';
import 'package:poc_flutter/features/posts/presentation/controllers/posts_controller.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  late PostsController controller;
  late MockPostsRepository mockRepository;

  setUp(() {
    mockRepository = MockPostsRepository();
    controller = PostsController(mockRepository);
  });

  final tPosts = [
    PostModel(id: 1, userId: 1, title: 'Test Title', body: 'Test Body'),
  ];

  final tComments = [
    CommentModel(
      id: 1,
      postId: 1,
      name: 'Test Name',
      email: 'test@email.com',
      body: 'Test Comment',
    ),
  ];

  test('should get posts successfully', () async {
    when(() => mockRepository.getPosts()).thenAnswer((_) async => tPosts);

    await controller.fetchPosts();

    expect(controller.posts, tPosts);
    expect(controller.isLoading.value, false);
    expect(controller.error.value, '');
    verify(() => mockRepository.getPosts()).called(1);
  });

  test('should return error when getting posts fails', () async {
    when(() => mockRepository.getPosts()).thenThrow(Exception('Erro'));

    await controller.fetchPosts();

    expect(controller.posts, isEmpty);
    expect(controller.isLoading.value, false);
    expect(controller.error.value, 'Erro ao carregar posts');
    verify(() => mockRepository.getPosts()).called(1);
  });

  test('should get comments successfully', () async {
    when(() => mockRepository.getPostComments(1)).thenAnswer((_) async => tComments);

    final result = await controller.getPostComments(1);

    expect(result, tComments);
    verify(() => mockRepository.getPostComments(1)).called(1);
  });

  test('should throw exception when getting comments fails', () async {
    when(() => mockRepository.getPostComments(1)).thenThrow(Exception('Erro'));

    expect(() => controller.getPostComments(1), throwsException);
    verify(() => mockRepository.getPostComments(1)).called(1);
  });
}
