import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_client.dart';
import '../services/auth_service.dart';
import '../services/tutor_service.dart';
import '../services/lesson_service.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.read(apiClientProvider)),
);

final tutorServiceProvider = Provider<TutorService>(
  (ref) => TutorService(ref.read(apiClientProvider)),
);

final lessonServiceProvider = Provider<LessonService>(
  (ref) => LessonService(ref.read(apiClientProvider)),
);