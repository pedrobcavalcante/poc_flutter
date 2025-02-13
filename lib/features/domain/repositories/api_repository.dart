abstract class IApiRepository {
  Future<dynamic> getData(String path, {Map<String, dynamic>? params});
  Future<dynamic> postData(String path, {dynamic data});
} 