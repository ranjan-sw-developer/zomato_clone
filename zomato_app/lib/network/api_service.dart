import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'https://zomato-backend-92de.onrender.com/api', // replace with your actual base URL
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
    final response = await _dio.get(endpoint, queryParameters: params);
    return response;
  }

  // POST request
  static Future<Response?> post(String endpoint, dynamic data) async {
    final response = await _dio.post(endpoint, data: data);
    return response;
  }

  // PUT request
  static Future<Response?> put(String endpoint, dynamic data) async {
    final response = await _dio.put(endpoint, data: data);
    return response;
  }

  // DELETE request
  static Future<Response?> delete(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    final response = await _dio.delete(endpoint, queryParameters: params);
    return response;
  }
}
