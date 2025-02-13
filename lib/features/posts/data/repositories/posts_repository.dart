import '../../domain/models/post_model.dart';
import '../../domain/models/comment_model.dart';
import '../datasources/posts_datasource.dart';

class PostsRepository {
  final PostsDatasource _datasource;

  PostsRepository(this._datasource);

  Future<List<PostModel>> getPosts() async {
    try {
      return await _datasource.getPosts();
    } catch (e) {
      throw Exception('Falha ao carregar posts');
    }
  }

  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      return await _datasource.getPostComments(postId);
    } catch (e) {
      throw Exception('Falha ao carregar comentários');
    }
  }
}
