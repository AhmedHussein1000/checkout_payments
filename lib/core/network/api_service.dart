import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> post({
    required Map<String, dynamic> body,
    required String url,
    String? token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );

    return response;
  }

  Future<Response> get({
    required String url,
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
