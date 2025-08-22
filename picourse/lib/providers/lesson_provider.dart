// lib/providers/lesson_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/lesson_request.dart';
import '../services/lesson_service.dart';
import 'providers.dart';

class LessonState {
  final List<LessonRequest> lessonRequests;
  final bool isLoading;
  final String? error;
  final String? successMessage;

  const LessonState({
    this.lessonRequests = const [],
    this.isLoading = false,
    this.error,
    this.successMessage,
  });

  LessonState copyWith({
    List<LessonRequest>? lessonRequests,
    bool? isLoading,
    String? error,
    String? successMessage,
  }) {
    return LessonState(
      lessonRequests: lessonRequests ?? this.lessonRequests,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      successMessage: successMessage,
    );
  }
}

class LessonNotifier extends StateNotifier<LessonState> {
  final LessonService _lessonService;

  LessonNotifier(this._lessonService) : super(const LessonState());

  Future<bool> createLessonRequest({
    required int tutorId,
    required int subjectId,
    required DateTime startTime,
    required int durationMinutes,
    String note = '',
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final request = LessonRequestCreate(
        tutorId: tutorId,
        subjectId: subjectId,
        startTime: startTime,
        durationMinutes: durationMinutes,
        note: note,
      );
      
      await _lessonService.createLessonRequest(request);
      
      state = state.copyWith(
        isLoading: false,
        successMessage: 'Lesson request created successfully!',
      );
      
      // Reload lesson requests
      loadLessonRequests();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to create lesson request',
      );
      return false;
    }
  }

  Future<void> loadLessonRequests({
    String? role,
    String? status,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final requests = await _lessonService.getLessonRequests(
        role: role,
        status: status,
        limit: 50,
      );
      
      state = state.copyWith(lessonRequests: requests, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load lesson requests',
      );
    }
  }

  Future<bool> updateLessonRequestStatus(int id, String status) async {
    try {
      await _lessonService.updateLessonRequestStatus(id, status);
      
      // Update local state
      final updatedRequests = state.lessonRequests.map((request) {
        if (request.id == id) {
          return request.copyWith(status: status);
        }
        return request;
      }).toList();
      
      state = state.copyWith(
        lessonRequests: updatedRequests,
        successMessage: 'Lesson request updated successfully!',
      );
      
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Failed to update lesson request');
      return false;
    }
  }

  void clearMessages() {
    state = state.copyWith(error: null, successMessage: null);
  }
}

final lessonProvider = StateNotifierProvider<LessonNotifier, LessonState>((ref) {
  return LessonNotifier(ref.read(lessonServiceProvider));
});