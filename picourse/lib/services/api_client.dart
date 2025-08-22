// lib/services/api_client.dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static const String baseUrl = 'http://localhost:8000/api'; // Android emulator
  // For iOS simulator: 'http://localhost:8000/api'
  // For physical device: 'http://YOUR_IP:8000/api'
  
  late final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ));
    
    _setupInterceptors();
  }
  
  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add auth token if available
        final token = await _storage.read(key: 'access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['Content-Type'] = 'application/json';
        handler.next(options);
      },
      onError: (error, handler) async {
        // Handle token refresh on 401
        if (error.response?.statusCode == 401) {
          if (await _refreshToken()) {
            // Retry the request with new token
            final token = await _storage.read(key: 'access_token');
            error.requestOptions.headers['Authorization'] = 'Bearer $token';
            final clonedRequest = await _dio.request(
              error.requestOptions.path,
              options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers,
              ),
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters,
            );
            return handler.resolve(clonedRequest);
          }
        }
        handler.next(error);
      },
    ));
  }
  
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken == null) return false;
      
      final response = await _dio.post('/auth/refresh/', 
          data: {'refresh': refreshToken});
      
      if (response.statusCode == 200) {
        await _storage.write(key: 'access_token', value: response.data['access']);
        return true;
      }
    } catch (e) {
      await clearTokens();
    }
    return false;
  }
  
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }
  
  Future<void> clearTokens() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }
  
  Future<bool> hasValidToken() async {
    final token = await _storage.read(key: 'access_token');
    return token != null;
  }
  
  // Auth endpoints
  Future<Response> register(Map<String, dynamic> data) async {
    return await _dio.post('/auth/register/', data: data);
  }
  
  Future<Response> login(Map<String, dynamic> data) async {
    return await _dio.post('/auth/login/', data: data);
  }
  
  // User endpoints
  Future<Response> getProfile() async {
    return await _dio.get('/me/');
  }
  
  Future<Response> updateProfile(Map<String, dynamic> data) async {
    return await _dio.patch('/me/', data: data);
  }
  
  // Tutor endpoints
  Future<Response> getTutors({
    int? subjectId,
    String? search,
    String? ordering,
    int? limit,
    int? offset,
  }) async {
    final params = <String, dynamic>{};
    if (subjectId != null) params['subject'] = subjectId;
    if (search != null && search.isNotEmpty) params['search'] = search;
    if (ordering != null) params['ordering'] = ordering;
    if (limit != null) params['limit'] = limit;
    if (offset != null) params['offset'] = offset;
    
    return await _dio.get('/tutors/', queryParameters: params);
  }
  
  Future<Response> getTutor(int id) async {
    return await _dio.get('/tutors/$id/');
  }
  
  // Subject endpoints
  Future<Response> getSubjects() async {
    return await _dio.get('/subjects/');
  }
  
  // Lesson request endpoints
  Future<Response> createLessonRequest(Map<String, dynamic> data) async {
    return await _dio.post('/lesson-requests/', data: data);
  }
  
  Future<Response> getLessonRequests({
    String? role,
    String? status,
    int? limit,
    int? offset,
  }) async {
    final params = <String, dynamic>{};
    if (role != null) params['role'] = role;
    if (status != null) params['status'] = status;
    if (limit != null) params['limit'] = limit;
    if (offset != null) params['offset'] = offset;
    
    return await _dio.get('/lesson-requests/', queryParameters: params);
  }
  
  Future<Response> updateLessonRequest(int id, String status) async {
    return await _dio.patch('/lesson-requests/$id/', data: {'status': status});
  }
}