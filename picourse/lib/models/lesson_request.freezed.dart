// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonRequest _$LessonRequestFromJson(Map<String, dynamic> json) {
  return _LessonRequest.fromJson(json);
}

/// @nodoc
mixin _$LessonRequest {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_email')
  String get studentEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'tutor_email')
  String get tutorEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'tutor_name')
  String get tutorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_name')
  String get subjectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LessonRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonRequestCopyWith<LessonRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonRequestCopyWith<$Res> {
  factory $LessonRequestCopyWith(
          LessonRequest value, $Res Function(LessonRequest) then) =
      _$LessonRequestCopyWithImpl<$Res, LessonRequest>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'student_email') String studentEmail,
      @JsonKey(name: 'tutor_email') String tutorEmail,
      @JsonKey(name: 'tutor_name') String tutorName,
      @JsonKey(name: 'subject_name') String subjectName,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      String status,
      String note,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$LessonRequestCopyWithImpl<$Res, $Val extends LessonRequest>
    implements $LessonRequestCopyWith<$Res> {
  _$LessonRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentEmail = null,
    Object? tutorEmail = null,
    Object? tutorName = null,
    Object? subjectName = null,
    Object? startTime = null,
    Object? durationMinutes = null,
    Object? status = null,
    Object? note = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      studentEmail: null == studentEmail
          ? _value.studentEmail
          : studentEmail // ignore: cast_nullable_to_non_nullable
              as String,
      tutorEmail: null == tutorEmail
          ? _value.tutorEmail
          : tutorEmail // ignore: cast_nullable_to_non_nullable
              as String,
      tutorName: null == tutorName
          ? _value.tutorName
          : tutorName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonRequestImplCopyWith<$Res>
    implements $LessonRequestCopyWith<$Res> {
  factory _$$LessonRequestImplCopyWith(
          _$LessonRequestImpl value, $Res Function(_$LessonRequestImpl) then) =
      __$$LessonRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'student_email') String studentEmail,
      @JsonKey(name: 'tutor_email') String tutorEmail,
      @JsonKey(name: 'tutor_name') String tutorName,
      @JsonKey(name: 'subject_name') String subjectName,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      String status,
      String note,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$LessonRequestImplCopyWithImpl<$Res>
    extends _$LessonRequestCopyWithImpl<$Res, _$LessonRequestImpl>
    implements _$$LessonRequestImplCopyWith<$Res> {
  __$$LessonRequestImplCopyWithImpl(
      _$LessonRequestImpl _value, $Res Function(_$LessonRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentEmail = null,
    Object? tutorEmail = null,
    Object? tutorName = null,
    Object? subjectName = null,
    Object? startTime = null,
    Object? durationMinutes = null,
    Object? status = null,
    Object? note = null,
    Object? createdAt = null,
  }) {
    return _then(_$LessonRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      studentEmail: null == studentEmail
          ? _value.studentEmail
          : studentEmail // ignore: cast_nullable_to_non_nullable
              as String,
      tutorEmail: null == tutorEmail
          ? _value.tutorEmail
          : tutorEmail // ignore: cast_nullable_to_non_nullable
              as String,
      tutorName: null == tutorName
          ? _value.tutorName
          : tutorName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonRequestImpl implements _LessonRequest {
  const _$LessonRequestImpl(
      {required this.id,
      @JsonKey(name: 'student_email') required this.studentEmail,
      @JsonKey(name: 'tutor_email') required this.tutorEmail,
      @JsonKey(name: 'tutor_name') required this.tutorName,
      @JsonKey(name: 'subject_name') required this.subjectName,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      required this.status,
      required this.note,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$LessonRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonRequestImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'student_email')
  final String studentEmail;
  @override
  @JsonKey(name: 'tutor_email')
  final String tutorEmail;
  @override
  @JsonKey(name: 'tutor_name')
  final String tutorName;
  @override
  @JsonKey(name: 'subject_name')
  final String subjectName;
  @override
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  final String status;
  @override
  final String note;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'LessonRequest(id: $id, studentEmail: $studentEmail, tutorEmail: $tutorEmail, tutorName: $tutorName, subjectName: $subjectName, startTime: $startTime, durationMinutes: $durationMinutes, status: $status, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentEmail, studentEmail) ||
                other.studentEmail == studentEmail) &&
            (identical(other.tutorEmail, tutorEmail) ||
                other.tutorEmail == tutorEmail) &&
            (identical(other.tutorName, tutorName) ||
                other.tutorName == tutorName) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      studentEmail,
      tutorEmail,
      tutorName,
      subjectName,
      startTime,
      durationMinutes,
      status,
      note,
      createdAt);

  /// Create a copy of LessonRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonRequestImplCopyWith<_$LessonRequestImpl> get copyWith =>
      __$$LessonRequestImplCopyWithImpl<_$LessonRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonRequestImplToJson(
      this,
    );
  }
}

abstract class _LessonRequest implements LessonRequest {
  const factory _LessonRequest(
          {required final int id,
          @JsonKey(name: 'student_email') required final String studentEmail,
          @JsonKey(name: 'tutor_email') required final String tutorEmail,
          @JsonKey(name: 'tutor_name') required final String tutorName,
          @JsonKey(name: 'subject_name') required final String subjectName,
          @JsonKey(name: 'start_time') required final DateTime startTime,
          @JsonKey(name: 'duration_minutes') required final int durationMinutes,
          required final String status,
          required final String note,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$LessonRequestImpl;

  factory _LessonRequest.fromJson(Map<String, dynamic> json) =
      _$LessonRequestImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'student_email')
  String get studentEmail;
  @override
  @JsonKey(name: 'tutor_email')
  String get tutorEmail;
  @override
  @JsonKey(name: 'tutor_name')
  String get tutorName;
  @override
  @JsonKey(name: 'subject_name')
  String get subjectName;
  @override
  @JsonKey(name: 'start_time')
  DateTime get startTime;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  String get status;
  @override
  String get note;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of LessonRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonRequestImplCopyWith<_$LessonRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonRequestCreate _$LessonRequestCreateFromJson(Map<String, dynamic> json) {
  return _LessonRequestCreate.fromJson(json);
}

/// @nodoc
mixin _$LessonRequestCreate {
  @JsonKey(name: 'tutor_id')
  int get tutorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_id')
  int get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this LessonRequestCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonRequestCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonRequestCreateCopyWith<LessonRequestCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonRequestCreateCopyWith<$Res> {
  factory $LessonRequestCreateCopyWith(
          LessonRequestCreate value, $Res Function(LessonRequestCreate) then) =
      _$LessonRequestCreateCopyWithImpl<$Res, LessonRequestCreate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tutor_id') int tutorId,
      @JsonKey(name: 'subject_id') int subjectId,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      String note});
}

/// @nodoc
class _$LessonRequestCreateCopyWithImpl<$Res, $Val extends LessonRequestCreate>
    implements $LessonRequestCreateCopyWith<$Res> {
  _$LessonRequestCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonRequestCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tutorId = null,
    Object? subjectId = null,
    Object? startTime = null,
    Object? durationMinutes = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonRequestCreateImplCopyWith<$Res>
    implements $LessonRequestCreateCopyWith<$Res> {
  factory _$$LessonRequestCreateImplCopyWith(_$LessonRequestCreateImpl value,
          $Res Function(_$LessonRequestCreateImpl) then) =
      __$$LessonRequestCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tutor_id') int tutorId,
      @JsonKey(name: 'subject_id') int subjectId,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      String note});
}

/// @nodoc
class __$$LessonRequestCreateImplCopyWithImpl<$Res>
    extends _$LessonRequestCreateCopyWithImpl<$Res, _$LessonRequestCreateImpl>
    implements _$$LessonRequestCreateImplCopyWith<$Res> {
  __$$LessonRequestCreateImplCopyWithImpl(_$LessonRequestCreateImpl _value,
      $Res Function(_$LessonRequestCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonRequestCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tutorId = null,
    Object? subjectId = null,
    Object? startTime = null,
    Object? durationMinutes = null,
    Object? note = null,
  }) {
    return _then(_$LessonRequestCreateImpl(
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonRequestCreateImpl implements _LessonRequestCreate {
  const _$LessonRequestCreateImpl(
      {@JsonKey(name: 'tutor_id') required this.tutorId,
      @JsonKey(name: 'subject_id') required this.subjectId,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      required this.note});

  factory _$LessonRequestCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonRequestCreateImplFromJson(json);

  @override
  @JsonKey(name: 'tutor_id')
  final int tutorId;
  @override
  @JsonKey(name: 'subject_id')
  final int subjectId;
  @override
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  final String note;

  @override
  String toString() {
    return 'LessonRequestCreate(tutorId: $tutorId, subjectId: $subjectId, startTime: $startTime, durationMinutes: $durationMinutes, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonRequestCreateImpl &&
            (identical(other.tutorId, tutorId) || other.tutorId == tutorId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, tutorId, subjectId, startTime, durationMinutes, note);

  /// Create a copy of LessonRequestCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonRequestCreateImplCopyWith<_$LessonRequestCreateImpl> get copyWith =>
      __$$LessonRequestCreateImplCopyWithImpl<_$LessonRequestCreateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonRequestCreateImplToJson(
      this,
    );
  }
}

abstract class _LessonRequestCreate implements LessonRequestCreate {
  const factory _LessonRequestCreate(
      {@JsonKey(name: 'tutor_id') required final int tutorId,
      @JsonKey(name: 'subject_id') required final int subjectId,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'duration_minutes') required final int durationMinutes,
      required final String note}) = _$LessonRequestCreateImpl;

  factory _LessonRequestCreate.fromJson(Map<String, dynamic> json) =
      _$LessonRequestCreateImpl.fromJson;

  @override
  @JsonKey(name: 'tutor_id')
  int get tutorId;
  @override
  @JsonKey(name: 'subject_id')
  int get subjectId;
  @override
  @JsonKey(name: 'start_time')
  DateTime get startTime;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  String get note;

  /// Create a copy of LessonRequestCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonRequestCreateImplCopyWith<_$LessonRequestCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
