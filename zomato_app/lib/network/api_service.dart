import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://your-api.com/api', // replace with your actual base URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // Optional: Call this to update the token
  static void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // GET request
  static Future<Response?> get(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      print('GET $endpoint error: $e');
      return null;
    }
  }

  // POST request
  static Future<Response?> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      print('POST $endpoint error: $e');
      return null;
    }
  }

  // PUT request
  static Future<Response?> put(String endpoint, dynamic data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      print('PUT $endpoint error: $e');
      return null;
    }
  }

  // DELETE request
  static Future<Response?> delete(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.delete(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      print('DELETE $endpoint error: $e');
      return null;
    }
  }
}
