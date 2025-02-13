import 'package:get/get.dart';
import 'package:poc_flutter/features/domain/usecases/get_data_usecase.dart';
import 'package:poc_flutter/features/domain/usecases/post_data_usecase.dart';

class ApiController extends GetxController {
  final GetDataUseCase _getDataUseCase;
  final PostDataUseCase _postDataUseCase;

  ApiController(this._getDataUseCase, this._postDataUseCase);

  Future<dynamic> getData(String path, {Map<String, dynamic>? params}) async {
    try {
      return await _getDataUseCase(path, params: params);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postData(String path, {dynamic data}) async {
    try {
      return await _postDataUseCase(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
