abstract class IHttpService {
  Future<String> get({required String url, dynamic headers, dynamic queryParameters});
}
