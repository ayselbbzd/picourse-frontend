// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonRequestImpl _$$LessonRequestImplFromJson(Map<String, dynamic> json) =>
    _$LessonRequestImpl(
      id: (json['id'] as num).toInt(),
      studentEmail: json['student_email'] as String,
      tutorEmail: json['tutor_email'] as String,
      tutorName: json['tutor_name'] as String,
      subjectName: json['subject_name'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      status: json['status'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$LessonRequestImplToJson(_$LessonRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_email': instance.studentEmail,
      'tutor_email': instance.tutorEmail,
      'tutor_name': instance.tutorName,
      'subject_name': instance.subjectName,
      'start_time': instance.startTime.toIso8601String(),
      'duration_minutes': instance.durationMinutes,
      'status': instance.status,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
    };

_$LessonRequestCreateImpl _$$LessonRequestCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonRequestCreateImpl(
      tutorId: (json['tutor_id'] as num).toInt(),
      subjectId: (json['subject_id'] as num).toInt(),
      startTime: DateTime.parse(json['start_time'] as String),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      note: json['note'] as String,
    );

Map<String, dynamic> _$$LessonRequestCreateImplToJson(
        _$LessonRequestCreateImpl instance) =>
    <String, dynamic>{
      'tutor_id': instance.tutorId,
      'subject_id': instance.subjectId,
      'start_time': instance.startTime.toIso8601String(),
      'duration_minutes': instance.durationMinutes,
      'note': instance.note,
    };
