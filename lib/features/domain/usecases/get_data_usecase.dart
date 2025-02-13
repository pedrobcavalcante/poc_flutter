import 'package:poc_flutter/features/domain/repositories/api_repository.dart';

class GetDataUseCase {
  final IApiRepository _repository;

  GetDataUseCase(this._repository);

  Future<dynamic> call(String path, {Map<String, dynamic>? params}) async {
    return await _repository.getData(path, params: params);
  }
} 