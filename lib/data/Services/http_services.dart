import 'package:dio/dio.dart';
import 'package:lady_taxi/utils/constants.dart';

class ApiRequest {
  final Dio dio =
      Dio(BaseOptions(baseUrl: LTUrl.baseUrl, connectTimeout: LTDuration.request, sendTimeout: LTDuration.request));

  Future<Response> doPostRequest(
      {required String path, Map<String, dynamic>? body, Map<String, dynamic>? query}) async {
    final Response response = await dio.post(path, data: body, queryParameters: query);
    return response;
  }

  Future<Response> doGetRequest({required String path, Map<String, dynamic>? query}) async {
    final Response response = await dio.get(path, queryParameters: query);
    return response;
  }
}
