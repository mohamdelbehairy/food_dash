import 'package:dio/dio.dart';
import 'package:food_dash/core/utils/api_keys.dart';

class ApiService {
  final _dio = Dio();
  Future<Response> post(
      {required String url,
      required body,
      Map<String, dynamic>? headers,
      String? contentType}) async {
    var response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType ?? Headers.formUrlEncodedContentType,
        headers: headers ??
            {
              'Authorization': 'Bearer ${ApiKeys.stripSecretKey}',
            },
      ),
    );
    return response;
  }
}
