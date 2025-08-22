import 'package:freezed_annotation/freezed_annotation.dart';
import 'subject.dart';

part 'tutor.freezed.dart';
part 'tutor.g.dart';

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
class Tutor with _$Tutor {
  const factory Tutor({
    required int id,
    required String name,
    required String bio,
    @JsonKey(name: 'hourly_rate') @StringToDoubleConverter() required double hourlyRate,
    required double rating,
    required List<Subject> subjects,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
  }) = _Tutor;

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
}
