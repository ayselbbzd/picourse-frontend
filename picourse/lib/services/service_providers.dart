// lib/services/service_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_client.dart';
import 'auth_service.dart';
import 'tutor_service.dart';
import 'lesson_service.dart';

// API Client Provider
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

// Service Providers
final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthService(apiClient);
});

final tutorServiceProvider = Provider<TutorService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return TutorService(apiClient);
});

final lessonServiceProvider = Provider<LessonService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return LessonService(apiClient);
});
