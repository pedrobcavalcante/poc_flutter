import 'package:poc_flutter/features/domain/repositories/api_repository.dart';

class PostDataUseCase {
  final IApiRepository _repository;

  PostDataUseCase(this._repository);

  Future<dynamic> call(String path, {dynamic data}) async {
    return await _repository.postData(path, data: data);
  }
} 