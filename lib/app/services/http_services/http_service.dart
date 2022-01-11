import 'package:http/http.dart' as http;
import 'i_http_service.dart';

class HttpService implements IHttpService {
  final _client = http.Client();

  @override
  Future<String> get({required String url, headers, queryParameters}) async {
    final _uri = Uri.parse(url).replace(queryParameters: queryParameters);

    final _response = await _client.get(_uri, headers: headers);

    return _response.body;
  }
}
