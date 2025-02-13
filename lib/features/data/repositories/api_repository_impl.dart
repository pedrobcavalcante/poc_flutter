import 'package:poc_flutter/features/data/datasources/api_datasource.dart';
import 'package:poc_flutter/features/domain/repositories/api_repository.dart';

class ApiRepositoryImpl implements IApiRepository {
  final IApiDatasource _datasource;

  ApiRepositoryImpl(this._datasource);

  @override
  Future<dynamic> getData(String path, {Map<String, dynamic>? params}) async {
    try {
      return await _datasource.get(path, queryParameters: params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> postData(String path, {dynamic data}) async {
    try {
      return await _datasource.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
} 