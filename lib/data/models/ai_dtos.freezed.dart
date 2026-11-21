// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CandidateDto {

 String get role; String get seniority; String get language; String get struggle;
/// Create a copy of CandidateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidateDtoCopyWith<CandidateDto> get copyWith => _$CandidateDtoCopyWithImpl<CandidateDto>(this as CandidateDto, _$identity);

  /// Serializes this CandidateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CandidateDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidateDto&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.seniority, _this.seniority) || other.seniority == _this.seniority)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.struggle, _this.struggle) || other.struggle == _this.struggle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CandidateDto;
  return Object.hash(runtimeType,_this.role,_this.seniority,_this.language,_this.struggle);
}

@override
String toString() {
  final _this = this as CandidateDto;
  return 'CandidateDto(role: ${_this.role}, seniority: ${_this.seniority}, language: ${_this.language}, struggle: ${_this.struggle})';
}


}

/// @nodoc
abstract mixin class $CandidateDtoCopyWith<$Res>  {
  factory $CandidateDtoCopyWith(CandidateDto value, $Res Function(CandidateDto) _then) = _$CandidateDtoCopyWithImpl;
@useResult
$Res call({
 String role, String seniority, String language, String struggle
});




}
/// @nodoc
class _$CandidateDtoCopyWithImpl<$Res>
    implements $CandidateDtoCopyWith<$Res> {
  _$CandidateDtoCopyWithImpl(this._self, this._then);

  final CandidateDto _self;
  final $Res Function(CandidateDto) _then;

/// Create a copy of CandidateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? seniority = null,Object? language = null,Object? struggle = null,}) {
  return _then(CandidateDto(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,seniority: null == seniority ? _self.seniority : seniority // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,struggle: null == struggle ? _self.struggle : struggle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CandidateDto].
extension CandidateDtoPatterns on CandidateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidateDto value)  $default,){
final _that = this;
switch (_that) {
case _CandidateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidateDto value)?  $default,){
final _that = this;
switch (_that) {
case _CandidateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String seniority,  String language,  String struggle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidateDto() when $default != null:
return $default(_that.role,_that.seniority,_that.language,_that.struggle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String seniority,  String language,  String struggle)  $default,) {final _that = this;
switch (_that) {
case _CandidateDto():
return $default(_that.role,_that.seniority,_that.language,_that.struggle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String seniority,  String language,  String struggle)?  $default,) {final _that = this;
switch (_that) {
case _CandidateDto() when $default != null:
return $default(_that.role,_that.seniority,_that.language,_that.struggle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidateDto implements CandidateDto {
  const _CandidateDto({required this.role, required this.seniority, required this.language, required this.struggle});
  factory _CandidateDto.fromJson(Map<String, dynamic> json) => _$CandidateDtoFromJson(json);

@override final  String role;
@override final  String seniority;
@override final  String language;
@override final  String struggle;

/// Create a copy of CandidateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidateDtoCopyWith<_CandidateDto> get copyWith => __$CandidateDtoCopyWithImpl<_CandidateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidateDto&&(identical(other.role, role) || other.role == role)&&(identical(other.seniority, seniority) || other.seniority == seniority)&&(identical(other.language, language) || other.language == language)&&(identical(other.struggle, struggle) || other.struggle == struggle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,role,seniority,language,struggle);
}

@override
String toString() {
    return 'CandidateDto(role: $role, seniority: $seniority, language: $language, struggle: $struggle)';
}


}

/// @nodoc
abstract mixin class _$CandidateDtoCopyWith<$Res> implements $CandidateDtoCopyWith<$Res> {
  factory _$CandidateDtoCopyWith(_CandidateDto value, $Res Function(_CandidateDto) _then) = __$CandidateDtoCopyWithImpl;
@override @useResult
$Res call({
 String role, String seniority, String language, String struggle
});




}
/// @nodoc
class __$CandidateDtoCopyWithImpl<$Res>
    implements _$CandidateDtoCopyWith<$Res> {
  __$CandidateDtoCopyWithImpl(this._self, this._then);

  final _CandidateDto _self;
  final $Res Function(_CandidateDto) _then;

/// Create a copy of CandidateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? seniority = null,Object? language = null,Object? struggle = null,}) {
  return _then(_CandidateDto(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,seniority: null == seniority ? _self.seniority : seniority // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,struggle: null == struggle ? _self.struggle : struggle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GeneratedQuestionDto {

 String get text; String get type; String get focus;
/// Create a copy of GeneratedQuestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedQuestionDtoCopyWith<GeneratedQuestionDto> get copyWith => _$GeneratedQuestionDtoCopyWithImpl<GeneratedQuestionDto>(this as GeneratedQuestionDto, _$identity);

  /// Serializes this GeneratedQuestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeneratedQuestionDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedQuestionDto&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.focus, _this.focus) || other.focus == _this.focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeneratedQuestionDto;
  return Object.hash(runtimeType,_this.text,_this.type,_this.focus);
}

@override
String toString() {
  final _this = this as GeneratedQuestionDto;
  return 'GeneratedQuestionDto(text: ${_this.text}, type: ${_this.type}, focus: ${_this.focus})';
}


}

/// @nodoc
abstract mixin class $GeneratedQuestionDtoCopyWith<$Res>  {
  factory $GeneratedQuestionDtoCopyWith(GeneratedQuestionDto value, $Res Function(GeneratedQuestionDto) _then) = _$GeneratedQuestionDtoCopyWithImpl;
@useResult
$Res call({
 String text, String type, String focus
});




}
/// @nodoc
class _$GeneratedQuestionDtoCopyWithImpl<$Res>
    implements $GeneratedQuestionDtoCopyWith<$Res> {
  _$GeneratedQuestionDtoCopyWithImpl(this._self, this._then);

  final GeneratedQuestionDto _self;
  final $Res Function(GeneratedQuestionDto) _then;

/// Create a copy of GeneratedQuestionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? type = null,Object? focus = null,}) {
  return _then(GeneratedQuestionDto(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneratedQuestionDto].
extension GeneratedQuestionDtoPatterns on GeneratedQuestionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratedQuestionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratedQuestionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratedQuestionDto value)  $default,){
final _that = this;
switch (_that) {
case _GeneratedQuestionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratedQuestionDto value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratedQuestionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String type,  String focus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratedQuestionDto() when $default != null:
return $default(_that.text,_that.type,_that.focus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String type,  String focus)  $default,) {final _that = this;
switch (_that) {
case _GeneratedQuestionDto():
return $default(_that.text,_that.type,_that.focus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String type,  String focus)?  $default,) {final _that = this;
switch (_that) {
case _GeneratedQuestionDto() when $default != null:
return $default(_that.text,_that.type,_that.focus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratedQuestionDto implements GeneratedQuestionDto {
  const _GeneratedQuestionDto({required this.text, required this.type, this.focus = ''});
  factory _GeneratedQuestionDto.fromJson(Map<String, dynamic> json) => _$GeneratedQuestionDtoFromJson(json);

@override final  String text;
@override final  String type;
@override@JsonKey() final  String focus;

/// Create a copy of GeneratedQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedQuestionDtoCopyWith<_GeneratedQuestionDto> get copyWith => __$GeneratedQuestionDtoCopyWithImpl<_GeneratedQuestionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedQuestionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedQuestionDto&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.focus, focus) || other.focus == focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text,type,focus);
}

@override
String toString() {
    return 'GeneratedQuestionDto(text: $text, type: $type, focus: $focus)';
}


}

/// @nodoc
abstract mixin class _$GeneratedQuestionDtoCopyWith<$Res> implements $GeneratedQuestionDtoCopyWith<$Res> {
  factory _$GeneratedQuestionDtoCopyWith(_GeneratedQuestionDto value, $Res Function(_GeneratedQuestionDto) _then) = __$GeneratedQuestionDtoCopyWithImpl;
@override @useResult
$Res call({
 String text, String type, String focus
});




}
/// @nodoc
class __$GeneratedQuestionDtoCopyWithImpl<$Res>
    implements _$GeneratedQuestionDtoCopyWith<$Res> {
  __$GeneratedQuestionDtoCopyWithImpl(this._self, this._then);

  final _GeneratedQuestionDto _self;
  final $Res Function(_GeneratedQuestionDto) _then;

/// Create a copy of GeneratedQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? type = null,Object? focus = null,}) {
  return _then(_GeneratedQuestionDto(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GenerateQuestionsResponseDto {

 String get roleSummary; List<GeneratedQuestionDto> get questions;
/// Create a copy of GenerateQuestionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateQuestionsResponseDtoCopyWith<GenerateQuestionsResponseDto> get copyWith => _$GenerateQuestionsResponseDtoCopyWithImpl<GenerateQuestionsResponseDto>(this as GenerateQuestionsResponseDto, _$identity);

  /// Serializes this GenerateQuestionsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GenerateQuestionsResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateQuestionsResponseDto&&(identical(other.roleSummary, _this.roleSummary) || other.roleSummary == _this.roleSummary)&&const DeepCollectionEquality().equals(other.questions, _this.questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GenerateQuestionsResponseDto;
  return Object.hash(runtimeType,_this.roleSummary,const DeepCollectionEquality().hash(_this.questions));
}

@override
String toString() {
  final _this = this as GenerateQuestionsResponseDto;
  return 'GenerateQuestionsResponseDto(roleSummary: ${_this.roleSummary}, questions: ${_this.questions})';
}


}

/// @nodoc
abstract mixin class $GenerateQuestionsResponseDtoCopyWith<$Res>  {
  factory $GenerateQuestionsResponseDtoCopyWith(GenerateQuestionsResponseDto value, $Res Function(GenerateQuestionsResponseDto) _then) = _$GenerateQuestionsResponseDtoCopyWithImpl;
@useResult
$Res call({
 String roleSummary, List<GeneratedQuestionDto> questions
});




}
/// @nodoc
class _$GenerateQuestionsResponseDtoCopyWithImpl<$Res>
    implements $GenerateQuestionsResponseDtoCopyWith<$Res> {
  _$GenerateQuestionsResponseDtoCopyWithImpl(this._self, this._then);

  final GenerateQuestionsResponseDto _self;
  final $Res Function(GenerateQuestionsResponseDto) _then;

/// Create a copy of GenerateQuestionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleSummary = null,Object? questions = null,}) {
  return _then(GenerateQuestionsResponseDto(
roleSummary: null == roleSummary ? _self.roleSummary : roleSummary // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<GeneratedQuestionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateQuestionsResponseDto].
extension GenerateQuestionsResponseDtoPatterns on GenerateQuestionsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateQuestionsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateQuestionsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateQuestionsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _GenerateQuestionsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateQuestionsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateQuestionsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roleSummary,  List<GeneratedQuestionDto> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateQuestionsResponseDto() when $default != null:
return $default(_that.roleSummary,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roleSummary,  List<GeneratedQuestionDto> questions)  $default,) {final _that = this;
switch (_that) {
case _GenerateQuestionsResponseDto():
return $default(_that.roleSummary,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roleSummary,  List<GeneratedQuestionDto> questions)?  $default,) {final _that = this;
switch (_that) {
case _GenerateQuestionsResponseDto() when $default != null:
return $default(_that.roleSummary,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateQuestionsResponseDto implements GenerateQuestionsResponseDto {
  const _GenerateQuestionsResponseDto({required this.roleSummary, required  List<GeneratedQuestionDto> questions}): _questions = questions;
  factory _GenerateQuestionsResponseDto.fromJson(Map<String, dynamic> json) => _$GenerateQuestionsResponseDtoFromJson(json);

@override final  String roleSummary;
 final  List<GeneratedQuestionDto> _questions;
@override List<GeneratedQuestionDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of GenerateQuestionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateQuestionsResponseDtoCopyWith<_GenerateQuestionsResponseDto> get copyWith => __$GenerateQuestionsResponseDtoCopyWithImpl<_GenerateQuestionsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateQuestionsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateQuestionsResponseDto&&(identical(other.roleSummary, roleSummary) || other.roleSummary == roleSummary)&&const DeepCollectionEquality().equals(other.questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roleSummary,const DeepCollectionEquality().hash(_questions));
}

@override
String toString() {
    return 'GenerateQuestionsResponseDto(roleSummary: $roleSummary, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$GenerateQuestionsResponseDtoCopyWith<$Res> implements $GenerateQuestionsResponseDtoCopyWith<$Res> {
  factory _$GenerateQuestionsResponseDtoCopyWith(_GenerateQuestionsResponseDto value, $Res Function(_GenerateQuestionsResponseDto) _then) = __$GenerateQuestionsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String roleSummary, List<GeneratedQuestionDto> questions
});




}
/// @nodoc
class __$GenerateQuestionsResponseDtoCopyWithImpl<$Res>
    implements _$GenerateQuestionsResponseDtoCopyWith<$Res> {
  __$GenerateQuestionsResponseDtoCopyWithImpl(this._self, this._then);

  final _GenerateQuestionsResponseDto _self;
  final $Res Function(_GenerateQuestionsResponseDto) _then;

/// Create a copy of GenerateQuestionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleSummary = null,Object? questions = null,}) {
  return _then(_GenerateQuestionsResponseDto(
roleSummary: null == roleSummary ? _self.roleSummary : roleSummary // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<GeneratedQuestionDto>,
  ));
}


}

// dart format on
