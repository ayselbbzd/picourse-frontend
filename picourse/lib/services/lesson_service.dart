// lib/services/lesson_service.dart
import '../models/lesson_request.dart';
import 'api_client.dart';

class LessonService {
  final ApiClient _apiClient;
  
  LessonService(this._apiClient);
  
  Future<LessonRequest> createLessonRequest(LessonRequestCreate request) async {
    final response = await _apiClient.createLessonRequest(request.toJson());
    return LessonRequest.fromJson(response.data);
  }
  
  Future<List<LessonRequest>> getLessonRequests({
    String? role,
    String? status,
    int? limit,
    int? offset,
  }) async {
    final response = await _apiClient.getLessonRequests(
      role: role,
      status: status,
      limit: limit,
      offset: offset,
    );
    
    final List<dynamic> results = response.data['results'];
    return results.map((json) => LessonRequest.fromJson(json)).toList();
  }
  
  Future<LessonRequest> updateLessonRequestStatus(int id, String status) async {
    final response = await _apiClient.updateLessonRequest(id, status);
    return LessonRequest.fromJson(response.data);
  }
}