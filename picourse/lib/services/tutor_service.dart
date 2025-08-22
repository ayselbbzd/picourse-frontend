// lib/services/tutor_service.dart
import '../models/tutor.dart';
import '../models/subject.dart';
import 'api_client.dart';

class TutorService {
  final ApiClient _apiClient;
  
  TutorService(this._apiClient);
  
  Future<List<Tutor>> getTutors({
    int? subjectId,
    String? search,
    String? ordering,
    int? limit,
    int? offset,
  }) async {
    final response = await _apiClient.getTutors(
      subjectId: subjectId,
      search: search,
      ordering: ordering,
      limit: limit,
      offset: offset,
    );
    
    final List<dynamic> results = response.data['results'];
    return results.map((json) => Tutor.fromJson(json)).toList();
  }
  
  Future<Tutor> getTutor(int id) async {
    final response = await _apiClient.getTutor(id);
    return Tutor.fromJson(response.data);
  }
  
  Future<List<Subject>> getSubjects() async {
    final response = await _apiClient.getSubjects();
    final List<dynamic> results = response.data;
    return results.map((json) => Subject.fromJson(json)).toList();
  }
}