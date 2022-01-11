import 'dart:convert';

import 'package:dio/dio.dart';
import 'i_http_service.dart';

class DioService implements IHttpService {
  final _dio = Dio();

  @override
  Future<String> get({required String url, dynamic headers, dynamic queryParameters}) async {
    final _response = await _dio.get(
      url,
      options: headers != null ? Options(headers: headers) : null,
      queryParameters: queryParameters,
    );

    return jsonEncode(_response.data);
  }
}
