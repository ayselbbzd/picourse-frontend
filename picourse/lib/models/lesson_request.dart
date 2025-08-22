import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_request.freezed.dart';
part 'lesson_request.g.dart';

@freezed
class LessonRequest with _$LessonRequest {
  const factory LessonRequest({
    required int id,
    @JsonKey(name: 'student_email') required String studentEmail,
    @JsonKey(name: 'tutor_email') required String tutorEmail,
    @JsonKey(name: 'tutor_name') required String tutorName,
    @JsonKey(name: 'subject_name') required String subjectName,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required String status,
    required String note,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _LessonRequest;

  factory LessonRequest.fromJson(Map<String, dynamic> json) => 
      _$LessonRequestFromJson(json);
}

@freezed
class LessonRequestCreate with _$LessonRequestCreate {
  const factory LessonRequestCreate({
    @JsonKey(name: 'tutor_id') required int tutorId,
    @JsonKey(name: 'subject_id') required int subjectId,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required String note,
  }) = _LessonRequestCreate;

  factory LessonRequestCreate.fromJson(Map<String, dynamic> json) => 
      _$LessonRequestCreateFromJson(json);
}
