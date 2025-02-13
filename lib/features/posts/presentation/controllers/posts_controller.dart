import 'package:get/get.dart';
import '../../data/repositories/posts_repository.dart';
import '../../domain/models/post_model.dart';
import '../../domain/models/comment_model.dart';

class PostsController extends GetxController {
  final PostsRepository _repository;
  
  PostsController(this._repository);

  final RxList<PostModel> posts = <PostModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      error.value = '';
      posts.value = await _repository.getPosts();
    } catch (e) {
      error.value = 'Erro ao carregar posts';
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      return await _repository.getPostComments(postId);
    } catch (e) {
      throw Exception('Erro ao carregar comentários');
    }
  }
} 