import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/core/http/dio_client.dart';
import 'package:poc_flutter/features/posts/bindings/posts_binding.dart';
import 'package:poc_flutter/features/posts/data/datasources/posts_datasource.dart';
import 'package:poc_flutter/features/posts/data/repositories/posts_repository.dart';
import 'package:poc_flutter/features/posts/presentation/controllers/posts_controller.dart';

void main() {
  late PostsBinding binding;

  setUp(() {
    binding = PostsBinding();
    binding.dependencies();
  });

  tearDown(() {
    Get.reset();
  });

  test('should register all dependencies', () {
    expect(Get.find<DioClient>(), isA<DioClient>());
    expect(Get.find<PostsDatasource>(), isA<PostsDatasourceImpl>());
    expect(Get.find<PostsRepository>(), isA<PostsRepository>());
    expect(Get.find<PostsController>(), isA<PostsController>());
  });
} 