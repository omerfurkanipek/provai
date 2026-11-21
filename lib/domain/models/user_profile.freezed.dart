// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get name; String get targetRole; Seniority get seniority; InterviewLanguage get interviewLanguage; Struggle get struggle; InterviewTiming get interviewTiming;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.targetRole, _this.targetRole) || other.targetRole == _this.targetRole)&&(identical(other.seniority, _this.seniority) || other.seniority == _this.seniority)&&(identical(other.interviewLanguage, _this.interviewLanguage) || other.interviewLanguage == _this.interviewLanguage)&&(identical(other.struggle, _this.struggle) || other.struggle == _this.struggle)&&(identical(other.interviewTiming, _this.interviewTiming) || other.interviewTiming == _this.interviewTiming));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hash(runtimeType,_this.name,_this.targetRole,_this.seniority,_this.interviewLanguage,_this.struggle,_this.interviewTiming);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(name: ${_this.name}, targetRole: ${_this.targetRole}, seniority: ${_this.seniority}, interviewLanguage: ${_this.interviewLanguage}, struggle: ${_this.struggle}, interviewTiming: ${_this.interviewTiming})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String name, String targetRole, Seniority seniority, InterviewLanguage interviewLanguage, Struggle struggle, InterviewTiming interviewTiming
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? targetRole = null,Object? seniority = null,Object? interviewLanguage = null,Object? struggle = null,Object? interviewTiming = null,}) {
  return _then(UserProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,targetRole: null == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String,seniority: null == seniority ? _self.seniority : seniority // ignore: cast_nullable_to_non_nullable
as Seniority,interviewLanguage: null == interviewLanguage ? _self.interviewLanguage : interviewLanguage // ignore: cast_nullable_to_non_nullable
as InterviewLanguage,struggle: null == struggle ? _self.struggle : struggle // ignore: cast_nullable_to_non_nullable
as Struggle,interviewTiming: null == interviewTiming ? _self.interviewTiming : interviewTiming // ignore: cast_nullable_to_non_nullable
as InterviewTiming,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String targetRole,  Seniority seniority,  InterviewLanguage interviewLanguage,  Struggle struggle,  InterviewTiming interviewTiming)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.name,_that.targetRole,_that.seniority,_that.interviewLanguage,_that.struggle,_that.interviewTiming);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String targetRole,  Seniority seniority,  InterviewLanguage interviewLanguage,  Struggle struggle,  InterviewTiming interviewTiming)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.name,_that.targetRole,_that.seniority,_that.interviewLanguage,_that.struggle,_that.interviewTiming);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String targetRole,  Seniority seniority,  InterviewLanguage interviewLanguage,  Struggle struggle,  InterviewTiming interviewTiming)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.name,_that.targetRole,_that.seniority,_that.interviewLanguage,_that.struggle,_that.interviewTiming);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({this.name = '', this.targetRole = '', this.seniority = Seniority.junior, this.interviewLanguage = InterviewLanguage.tr, this.struggle = Struggle.technical, this.interviewTiming = InterviewTiming.notScheduled});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String targetRole;
@override@JsonKey() final  Seniority seniority;
@override@JsonKey() final  InterviewLanguage interviewLanguage;
@override@JsonKey() final  Struggle struggle;
@override@JsonKey() final  InterviewTiming interviewTiming;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole)&&(identical(other.seniority, seniority) || other.seniority == seniority)&&(identical(other.interviewLanguage, interviewLanguage) || other.interviewLanguage == interviewLanguage)&&(identical(other.struggle, struggle) || other.struggle == struggle)&&(identical(other.interviewTiming, interviewTiming) || other.interviewTiming == interviewTiming));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,targetRole,seniority,interviewLanguage,struggle,interviewTiming);
}

@override
String toString() {
    return 'UserProfile(name: $name, targetRole: $targetRole, seniority: $seniority, interviewLanguage: $interviewLanguage, struggle: $struggle, interviewTiming: $interviewTiming)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String targetRole, Seniority seniority, InterviewLanguage interviewLanguage, Struggle struggle, InterviewTiming interviewTiming
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? targetRole = null,Object? seniority = null,Object? interviewLanguage = null,Object? struggle = null,Object? interviewTiming = null,}) {
  return _then(_UserProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,targetRole: null == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String,seniority: null == seniority ? _self.seniority : seniority // ignore: cast_nullable_to_non_nullable
as Seniority,interviewLanguage: null == interviewLanguage ? _self.interviewLanguage : interviewLanguage // ignore: cast_nullable_to_non_nullable
as InterviewLanguage,struggle: null == struggle ? _self.struggle : struggle // ignore: cast_nullable_to_non_nullable
as Struggle,interviewTiming: null == interviewTiming ? _self.interviewTiming : interviewTiming // ignore: cast_nullable_to_non_nullable
as InterviewTiming,
  ));
}


}

// dart format on
