// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorImpl _$$TutorImplFromJson(Map<String, dynamic> json) => _$TutorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      bio: json['bio'] as String,
      hourlyRate: const StringToDoubleConverter().fromJson(json['hourly_rate']),
      rating: (json['rating'] as num).toDouble(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$$TutorImplToJson(_$TutorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'hourly_rate':
          const StringToDoubleConverter().toJson(instance.hourlyRate),
      'rating': instance.rating,
      'subjects': instance.subjects,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
