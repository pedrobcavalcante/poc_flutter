import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_flutter/features/posts/domain/models/post_model.dart';
import 'package:poc_flutter/features/posts/domain/models/comment_model.dart';
import 'package:poc_flutter/features/posts/presentation/controllers/posts_controller.dart';
import 'package:poc_flutter/features/posts/presentation/pages/post_details_page.dart';

class MockPostsController extends GetxController with Mock implements PostsController {}

void main() {
  late MockPostsController mockController;
  late PostModel testPost;

  setUp(() {
    mockController = MockPostsController();
    Get.put<PostsController>(mockController);

    testPost = PostModel(
      id: 1,
      title: 'Test Post',
      body: 'Test Body',
      userId: 1,
    );
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('should display post details correctly', (tester) async {
    final comments = [
      CommentModel(
        id: 1,
        postId: 1,
        name: 'Test Comment',
        email: 'test@test.com',
        body: 'Test Comment Body',
      ),
    ];

    when(() => mockController.getPostComments(any()))
        .thenAnswer((_) async => comments);

    await tester.pumpWidget(
      GetMaterialApp(
        home: PostDetailsPage(post: testPost),
      ),
    );

    expect(find.text('Test Post'), findsOneWidget);
    expect(find.text('Test Body'), findsOneWidget);

    await tester.pump();
    
    expect(find.text('Comentários'), findsOneWidget);
    verify(() => mockController.getPostComments(1)).called(1);
  });

  testWidgets('should show error when loading comments fails', (tester) async {
    when(() => mockController.getPostComments(any()))
        .thenAnswer((_) async => throw Exception('Erro ao carregar comentários'));

    await tester.pumpWidget(
      GetMaterialApp(
        home: PostDetailsPage(post: testPost),
      ),
    );

    await tester.pumpAndSettle();
    
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
    expect(find.textContaining('Erro: Exception'), findsOneWidget);
  });
} 