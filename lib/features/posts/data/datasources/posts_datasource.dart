import '../../../../core/http/dio_client.dart';
import '../../domain/models/post_model.dart';
import '../../domain/models/comment_model.dart';

abstract class PostsDatasource {
  Future<List<PostModel>> getPosts();
  Future<List<CommentModel>> getPostComments(int postId);
}

class PostsDatasourceImpl implements PostsDatasource {
  final DioClient _dioClient;

  PostsDatasourceImpl(this._dioClient);

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _dioClient.instance.get('/posts');
      return (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Falha ao carregar posts');
    }
  }

  @override
  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      final response = await _dioClient.instance.get('/posts/$postId/comments');
      return (response.data as List)
          .map((json) => CommentModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Falha ao carregar comentários');
    }
  }
}
