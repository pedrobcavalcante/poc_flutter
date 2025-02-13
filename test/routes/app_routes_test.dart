import 'package:flutter_test/flutter_test.dart';

import 'package:poc_flutter/routes/app_routes.dart';
import 'package:poc_flutter/features/posts/presentation/pages/posts_page.dart';
import 'package:poc_flutter/features/counters/presentation/pages/home_screen.dart';

void main() {
  test('should contain all required routes', () {
    final routes = AppRoutes.routes;

    expect(
      routes.any((route) => route.name == HomeScreen.route),
      true,
      reason: 'Should contain HomeScreen route',
    );

    expect(
      routes.any((route) => route.name == PostsPage.route),
      true,
      reason: 'Should contain PostsPage route',
    );

    final postsRoute =
        routes.firstWhere((route) => route.name == PostsPage.route);
    expect(postsRoute.binding, isNotNull);
    expect(postsRoute.children, isNotEmpty);
  });
}
