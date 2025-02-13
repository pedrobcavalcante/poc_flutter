import 'package:get/get.dart';

import '../features/counters/presentation/pages/home_screen.dart';
import '../features/counters/presentation/pages/stream_counter_screen.dart';
import '../features/counters/presentation/pages/bloc_counter_screen.dart';
import '../features/counters/presentation/pages/getx_counter_screen.dart';
import '../features/posts/bindings/posts_binding.dart';
import '../features/posts/presentation/controllers/posts_controller.dart';
import '../features/posts/presentation/pages/post_details_page.dart';
import '../features/posts/presentation/pages/posts_page.dart';

abstract class AppRoutes {
  static final routes = [
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: StreamCounterScreen.route,
      page: () => const StreamCounterScreen(),
    ),
    GetPage(
      name: BlocCounterScreen.route,
      page: () => const BlocCounterScreen(),
    ),
    GetPage(
      name: GetXCounterScreen.route,
      page: () => GetXCounterScreen(),
    ),
    GetPage(
      name: PostsPage.route,
      page: () => const PostsPage(),
      binding: PostsBinding(),
      children: [
        GetPage(
          name: '/:id',
          page: () {
            final postId = int.parse(Get.parameters['id'] ?? '0');
            return PostDetailsPage(
              post: Get.find<PostsController>()
                  .posts
                  .firstWhere((post) => post.id == postId),
            );
          },
        ),
      ],
    ),
  ];
}
