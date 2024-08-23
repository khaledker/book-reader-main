import 'dart:io';

// Don't use any package other than dart:io
// You can use any class from dart:io

class Http {
  static final HttpClient _defaultHttpClient = HttpClient();

  static Future<HttpClientResponse> get(Uri uri) async {
    try {
      final request = await _defaultHttpClient.getUrl(uri);

      final response = await request.close();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
