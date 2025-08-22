// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      role: json['role'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      studentProfile: json['student_profile'] == null
          ? null
          : StudentProfile.fromJson(
              json['student_profile'] as Map<String, dynamic>),
      tutorProfile: json['tutor_profile'] == null
          ? null
          : TutorProfile.fromJson(
              json['tutor_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'student_profile': instance.studentProfile,
      'tutor_profile': instance.tutorProfile,
    };

_$StudentProfileImpl _$$StudentProfileImplFromJson(Map<String, dynamic> json) =>
    _$StudentProfileImpl(
      gradeLevel: json['grade_level'] as String?,
    );

Map<String, dynamic> _$$StudentProfileImplToJson(
        _$StudentProfileImpl instance) =>
    <String, dynamic>{
      'grade_level': instance.gradeLevel,
    };

_$TutorProfileImpl _$$TutorProfileImplFromJson(Map<String, dynamic> json) =>
    _$TutorProfileImpl(
      name: json['name'] as String,
      bio: json['bio'] as String,
      hourlyRate: const StringToDoubleConverter().fromJson(json['hourly_rate']),
      rating: (json['rating'] as num).toDouble(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TutorProfileImplToJson(_$TutorProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'hourly_rate':
          const StringToDoubleConverter().toJson(instance.hourlyRate),
      'rating': instance.rating,
      'subjects': instance.subjects,
    };
