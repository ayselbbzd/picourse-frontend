// lib/providers/tutor_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tutor.dart';
import '../models/subject.dart';
import '../services/tutor_service.dart';
import 'providers.dart';

class TutorState {
  final List<Tutor> tutors;
  final List<Subject> subjects;
  final bool isLoading;
  final String? error;
  final Tutor? selectedTutor;

  const TutorState({
    this.tutors = const [],
    this.subjects = const [],
    this.isLoading = false,
    this.error,
    this.selectedTutor,
  });

  TutorState copyWith({
    List<Tutor>? tutors,
    List<Subject>? subjects,
    bool? isLoading,
    String? error,
    Tutor? selectedTutor,
  }) {
    return TutorState(
      tutors: tutors ?? this.tutors,
      subjects: subjects ?? this.subjects,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedTutor: selectedTutor ?? this.selectedTutor,
    );
  }
}

class TutorNotifier extends StateNotifier<TutorState> {
  final TutorService _tutorService;

  TutorNotifier(this._tutorService) : super(const TutorState()) {
    loadSubjects();
    loadTutors();
  }

  Future<void> loadSubjects() async {
    try {
      final subjects = await _tutorService.getSubjects();
      state = state.copyWith(subjects: subjects);
    } catch (e) {
      state = state.copyWith(error: 'Failed to load subjects');
    }
  }

  Future<void> loadTutors({
    int? subjectId,
    String? search,
    String? ordering = '-rating',
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final tutors = await _tutorService.getTutors(
        subjectId: subjectId,
        search: search,
        ordering: ordering,
        limit: 20,
      );
      
      state = state.copyWith(tutors: tutors, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load tutors',
      );
    }
  }

  Future<void> loadTutorDetail(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final tutor = await _tutorService.getTutor(id);
      state = state.copyWith(selectedTutor: tutor, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load tutor details',
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final tutorProvider = StateNotifierProvider<TutorNotifier, TutorState>((ref) {
  return TutorNotifier(ref.read(tutorServiceProvider));
});
