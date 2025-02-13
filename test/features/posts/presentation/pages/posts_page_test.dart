import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_flutter/features/posts/domain/models/post_model.dart';
import 'package:poc_flutter/features/posts/presentation/controllers/posts_controller.dart';
import 'package:poc_flutter/features/posts/presentation/pages/posts_page.dart';

class MockPostsController extends GetxController
    with Mock
    implements PostsController {}

void main() {
  late MockPostsController mockController;

  setUp(() {
    mockController = MockPostsController();
    Get.put<PostsController>(mockController);
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('should show loading indicator when loading', (tester) async {
    when(() => mockController.isLoading).thenReturn(true.obs);
    when(() => mockController.error).thenReturn(''.obs);
    when(() => mockController.posts).thenReturn(RxList<PostModel>([]));

    await tester.pumpWidget(
      const GetMaterialApp(
        home: PostsPage(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message when there is an error',
      (tester) async {
    when(() => mockController.isLoading).thenReturn(false.obs);
    when(() => mockController.error).thenReturn('Erro ao carregar posts'.obs);
    when(() => mockController.posts).thenReturn(RxList<PostModel>([]));
    when(() => mockController.fetchPosts()).thenAnswer((_) async {});

    await tester.pumpWidget(
      const GetMaterialApp(
        home: PostsPage(),
      ),
    );

    expect(find.text('Erro ao carregar posts'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
  });

  testWidgets('should show posts list when loaded successfully',
      (tester) async {
    final posts = [
      PostModel(id: 1, title: 'Test Post', body: 'Test Body', userId: 1),
    ];

    when(() => mockController.isLoading).thenReturn(false.obs);
    when(() => mockController.error).thenReturn(''.obs);
    when(() => mockController.posts).thenReturn(RxList<PostModel>(posts));
    when(() => mockController.fetchPosts()).thenAnswer((_) async {});

    await tester.pumpWidget(
      const GetMaterialApp(
        home: PostsPage(),
      ),
    );

    expect(find.text('Test Post'), findsOneWidget);
    expect(find.text('Test Body'), findsOneWidget);
  });
}
