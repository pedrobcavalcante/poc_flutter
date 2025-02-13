import 'package:get/get.dart';
import '../data/datasources/posts_datasource.dart';
import '../data/repositories/posts_repository.dart';
import '../presentation/controllers/posts_controller.dart';
import '../../../core/http/dio_client.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClient());
    Get.lazyPut<PostsDatasource>(() => PostsDatasourceImpl(Get.find<DioClient>()));
    Get.lazyPut(() => PostsRepository(Get.find<PostsDatasource>()));
    Get.lazyPut(() => PostsController(Get.find<PostsRepository>()));
  }
} 