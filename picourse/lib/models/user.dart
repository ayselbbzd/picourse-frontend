// lib/models/user.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'subject.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class StringToDoubleConverter implements JsonConverter<double, dynamic> {
  const StringToDoubleConverter();

  @override
  double fromJson(dynamic json) {
    if (json is String) {
      return double.parse(json);
    } else if (json is num) {
      return json.toDouble();
    }
    throw ArgumentError('Cannot convert $json to double');
  }

  @override
  dynamic toJson(double object) => object.toString();
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String role,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'student_profile') StudentProfile? studentProfile,
    @JsonKey(name: 'tutor_profile') TutorProfile? tutorProfile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class StudentProfile with _$StudentProfile {
  const factory StudentProfile({
    @JsonKey(name: 'grade_level') String? gradeLevel,
  }) = _StudentProfile;

  factory StudentProfile.fromJson(Map<String, dynamic> json) => 
      _$StudentProfileFromJson(json);
}

@freezed
class TutorProfile with _$TutorProfile {
  const factory TutorProfile({
    required String name,
    required String bio,
    @JsonKey(name: 'hourly_rate') @StringToDoubleConverter() required double hourlyRate,
    required double rating,
    required List<Subject> subjects,
  }) = _TutorProfile;

  factory TutorProfile.fromJson(Map<String, dynamic> json) => 
      _$TutorProfileFromJson(json);
}