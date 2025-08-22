// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_profile')
  StudentProfile? get studentProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'tutor_profile')
  TutorProfile? get tutorProfile => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String email,
      String role,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'student_profile') StudentProfile? studentProfile,
      @JsonKey(name: 'tutor_profile') TutorProfile? tutorProfile});

  $StudentProfileCopyWith<$Res>? get studentProfile;
  $TutorProfileCopyWith<$Res>? get tutorProfile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? studentProfile = freezed,
    Object? tutorProfile = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentProfile: freezed == studentProfile
          ? _value.studentProfile
          : studentProfile // ignore: cast_nullable_to_non_nullable
              as StudentProfile?,
      tutorProfile: freezed == tutorProfile
          ? _value.tutorProfile
          : tutorProfile // ignore: cast_nullable_to_non_nullable
              as TutorProfile?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentProfileCopyWith<$Res>? get studentProfile {
    if (_value.studentProfile == null) {
      return null;
    }

    return $StudentProfileCopyWith<$Res>(_value.studentProfile!, (value) {
      return _then(_value.copyWith(studentProfile: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TutorProfileCopyWith<$Res>? get tutorProfile {
    if (_value.tutorProfile == null) {
      return null;
    }

    return $TutorProfileCopyWith<$Res>(_value.tutorProfile!, (value) {
      return _then(_value.copyWith(tutorProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String role,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'student_profile') StudentProfile? studentProfile,
      @JsonKey(name: 'tutor_profile') TutorProfile? tutorProfile});

  @override
  $StudentProfileCopyWith<$Res>? get studentProfile;
  @override
  $TutorProfileCopyWith<$Res>? get tutorProfile;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? studentProfile = freezed,
    Object? tutorProfile = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentProfile: freezed == studentProfile
          ? _value.studentProfile
          : studentProfile // ignore: cast_nullable_to_non_nullable
              as StudentProfile?,
      tutorProfile: freezed == tutorProfile
          ? _value.tutorProfile
          : tutorProfile // ignore: cast_nullable_to_non_nullable
              as TutorProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.role,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'student_profile') this.studentProfile,
      @JsonKey(name: 'tutor_profile') this.tutorProfile});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String role;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'student_profile')
  final StudentProfile? studentProfile;
  @override
  @JsonKey(name: 'tutor_profile')
  final TutorProfile? tutorProfile;

  @override
  String toString() {
    return 'User(id: $id, email: $email, role: $role, firstName: $firstName, lastName: $lastName, studentProfile: $studentProfile, tutorProfile: $tutorProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.studentProfile, studentProfile) ||
                other.studentProfile == studentProfile) &&
            (identical(other.tutorProfile, tutorProfile) ||
                other.tutorProfile == tutorProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, role, firstName,
      lastName, studentProfile, tutorProfile);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String email,
      required final String role,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'student_profile') final StudentProfile? studentProfile,
      @JsonKey(name: 'tutor_profile')
      final TutorProfile? tutorProfile}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get role;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'student_profile')
  StudentProfile? get studentProfile;
  @override
  @JsonKey(name: 'tutor_profile')
  TutorProfile? get tutorProfile;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentProfile _$StudentProfileFromJson(Map<String, dynamic> json) {
  return _StudentProfile.fromJson(json);
}

/// @nodoc
mixin _$StudentProfile {
  @JsonKey(name: 'grade_level')
  String? get gradeLevel => throw _privateConstructorUsedError;

  /// Serializes this StudentProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProfileCopyWith<StudentProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProfileCopyWith<$Res> {
  factory $StudentProfileCopyWith(
          StudentProfile value, $Res Function(StudentProfile) then) =
      _$StudentProfileCopyWithImpl<$Res, StudentProfile>;
  @useResult
  $Res call({@JsonKey(name: 'grade_level') String? gradeLevel});
}

/// @nodoc
class _$StudentProfileCopyWithImpl<$Res, $Val extends StudentProfile>
    implements $StudentProfileCopyWith<$Res> {
  _$StudentProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradeLevel = freezed,
  }) {
    return _then(_value.copyWith(
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentProfileImplCopyWith<$Res>
    implements $StudentProfileCopyWith<$Res> {
  factory _$$StudentProfileImplCopyWith(_$StudentProfileImpl value,
          $Res Function(_$StudentProfileImpl) then) =
      __$$StudentProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'grade_level') String? gradeLevel});
}

/// @nodoc
class __$$StudentProfileImplCopyWithImpl<$Res>
    extends _$StudentProfileCopyWithImpl<$Res, _$StudentProfileImpl>
    implements _$$StudentProfileImplCopyWith<$Res> {
  __$$StudentProfileImplCopyWithImpl(
      _$StudentProfileImpl _value, $Res Function(_$StudentProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradeLevel = freezed,
  }) {
    return _then(_$StudentProfileImpl(
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentProfileImpl implements _StudentProfile {
  const _$StudentProfileImpl({@JsonKey(name: 'grade_level') this.gradeLevel});

  factory _$StudentProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProfileImplFromJson(json);

  @override
  @JsonKey(name: 'grade_level')
  final String? gradeLevel;

  @override
  String toString() {
    return 'StudentProfile(gradeLevel: $gradeLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProfileImpl &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gradeLevel);

  /// Create a copy of StudentProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProfileImplCopyWith<_$StudentProfileImpl> get copyWith =>
      __$$StudentProfileImplCopyWithImpl<_$StudentProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentProfileImplToJson(
      this,
    );
  }
}

abstract class _StudentProfile implements StudentProfile {
  const factory _StudentProfile(
          {@JsonKey(name: 'grade_level') final String? gradeLevel}) =
      _$StudentProfileImpl;

  factory _StudentProfile.fromJson(Map<String, dynamic> json) =
      _$StudentProfileImpl.fromJson;

  @override
  @JsonKey(name: 'grade_level')
  String? get gradeLevel;

  /// Create a copy of StudentProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProfileImplCopyWith<_$StudentProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TutorProfile _$TutorProfileFromJson(Map<String, dynamic> json) {
  return _TutorProfile.fromJson(json);
}

/// @nodoc
mixin _$TutorProfile {
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'hourly_rate')
  @StringToDoubleConverter()
  double get hourlyRate => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<Subject> get subjects => throw _privateConstructorUsedError;

  /// Serializes this TutorProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TutorProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TutorProfileCopyWith<TutorProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorProfileCopyWith<$Res> {
  factory $TutorProfileCopyWith(
          TutorProfile value, $Res Function(TutorProfile) then) =
      _$TutorProfileCopyWithImpl<$Res, TutorProfile>;
  @useResult
  $Res call(
      {String name,
      String bio,
      @JsonKey(name: 'hourly_rate')
      @StringToDoubleConverter()
      double hourlyRate,
      double rating,
      List<Subject> subjects});
}

/// @nodoc
class _$TutorProfileCopyWithImpl<$Res, $Val extends TutorProfile>
    implements $TutorProfileCopyWith<$Res> {
  _$TutorProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TutorProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bio = null,
    Object? hourlyRate = null,
    Object? rating = null,
    Object? subjects = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorProfileImplCopyWith<$Res>
    implements $TutorProfileCopyWith<$Res> {
  factory _$$TutorProfileImplCopyWith(
          _$TutorProfileImpl value, $Res Function(_$TutorProfileImpl) then) =
      __$$TutorProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String bio,
      @JsonKey(name: 'hourly_rate')
      @StringToDoubleConverter()
      double hourlyRate,
      double rating,
      List<Subject> subjects});
}

/// @nodoc
class __$$TutorProfileImplCopyWithImpl<$Res>
    extends _$TutorProfileCopyWithImpl<$Res, _$TutorProfileImpl>
    implements _$$TutorProfileImplCopyWith<$Res> {
  __$$TutorProfileImplCopyWithImpl(
      _$TutorProfileImpl _value, $Res Function(_$TutorProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of TutorProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bio = null,
    Object? hourlyRate = null,
    Object? rating = null,
    Object? subjects = null,
  }) {
    return _then(_$TutorProfileImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TutorProfileImpl implements _TutorProfile {
  const _$TutorProfileImpl(
      {required this.name,
      required this.bio,
      @JsonKey(name: 'hourly_rate')
      @StringToDoubleConverter()
      required this.hourlyRate,
      required this.rating,
      required final List<Subject> subjects})
      : _subjects = subjects;

  factory _$TutorProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorProfileImplFromJson(json);

  @override
  final String name;
  @override
  final String bio;
  @override
  @JsonKey(name: 'hourly_rate')
  @StringToDoubleConverter()
  final double hourlyRate;
  @override
  final double rating;
  final List<Subject> _subjects;
  @override
  List<Subject> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  String toString() {
    return 'TutorProfile(name: $name, bio: $bio, hourlyRate: $hourlyRate, rating: $rating, subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, bio, hourlyRate, rating,
      const DeepCollectionEquality().hash(_subjects));

  /// Create a copy of TutorProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorProfileImplCopyWith<_$TutorProfileImpl> get copyWith =>
      __$$TutorProfileImplCopyWithImpl<_$TutorProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorProfileImplToJson(
      this,
    );
  }
}

abstract class _TutorProfile implements TutorProfile {
  const factory _TutorProfile(
      {required final String name,
      required final String bio,
      @JsonKey(name: 'hourly_rate')
      @StringToDoubleConverter()
      required final double hourlyRate,
      required final double rating,
      required final List<Subject> subjects}) = _$TutorProfileImpl;

  factory _TutorProfile.fromJson(Map<String, dynamic> json) =
      _$TutorProfileImpl.fromJson;

  @override
  String get name;
  @override
  String get bio;
  @override
  @JsonKey(name: 'hourly_rate')
  @StringToDoubleConverter()
  double get hourlyRate;
  @override
  double get rating;
  @override
  List<Subject> get subjects;

  /// Create a copy of TutorProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TutorProfileImplCopyWith<_$TutorProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
