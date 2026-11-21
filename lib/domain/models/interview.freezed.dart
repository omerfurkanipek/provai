// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterviewQuestion {

 String get id; String get text; QuestionType get type; String get focus;
/// Create a copy of InterviewQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewQuestionCopyWith<InterviewQuestion> get copyWith => _$InterviewQuestionCopyWithImpl<InterviewQuestion>(this as InterviewQuestion, _$identity);

  /// Serializes this InterviewQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InterviewQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewQuestion&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.focus, _this.focus) || other.focus == _this.focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InterviewQuestion;
  return Object.hash(runtimeType,_this.id,_this.text,_this.type,_this.focus);
}

@override
String toString() {
  final _this = this as InterviewQuestion;
  return 'InterviewQuestion(id: ${_this.id}, text: ${_this.text}, type: ${_this.type}, focus: ${_this.focus})';
}


}

/// @nodoc
abstract mixin class $InterviewQuestionCopyWith<$Res>  {
  factory $InterviewQuestionCopyWith(InterviewQuestion value, $Res Function(InterviewQuestion) _then) = _$InterviewQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String text, QuestionType type, String focus
});




}
/// @nodoc
class _$InterviewQuestionCopyWithImpl<$Res>
    implements $InterviewQuestionCopyWith<$Res> {
  _$InterviewQuestionCopyWithImpl(this._self, this._then);

  final InterviewQuestion _self;
  final $Res Function(InterviewQuestion) _then;

/// Create a copy of InterviewQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? type = null,Object? focus = null,}) {
  return _then(InterviewQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewQuestion].
extension InterviewQuestionPatterns on InterviewQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewQuestion value)  $default,){
final _that = this;
switch (_that) {
case _InterviewQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  QuestionType type,  String focus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewQuestion() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.focus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  QuestionType type,  String focus)  $default,) {final _that = this;
switch (_that) {
case _InterviewQuestion():
return $default(_that.id,_that.text,_that.type,_that.focus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  QuestionType type,  String focus)?  $default,) {final _that = this;
switch (_that) {
case _InterviewQuestion() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.focus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewQuestion implements InterviewQuestion {
  const _InterviewQuestion({required this.id, required this.text, required this.type, this.focus = ''});
  factory _InterviewQuestion.fromJson(Map<String, dynamic> json) => _$InterviewQuestionFromJson(json);

@override final  String id;
@override final  String text;
@override final  QuestionType type;
@override@JsonKey() final  String focus;

/// Create a copy of InterviewQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewQuestionCopyWith<_InterviewQuestion> get copyWith => __$InterviewQuestionCopyWithImpl<_InterviewQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.focus, focus) || other.focus == focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,text,type,focus);
}

@override
String toString() {
    return 'InterviewQuestion(id: $id, text: $text, type: $type, focus: $focus)';
}


}

/// @nodoc
abstract mixin class _$InterviewQuestionCopyWith<$Res> implements $InterviewQuestionCopyWith<$Res> {
  factory _$InterviewQuestionCopyWith(_InterviewQuestion value, $Res Function(_InterviewQuestion) _then) = __$InterviewQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, QuestionType type, String focus
});




}
/// @nodoc
class __$InterviewQuestionCopyWithImpl<$Res>
    implements _$InterviewQuestionCopyWith<$Res> {
  __$InterviewQuestionCopyWithImpl(this._self, this._then);

  final _InterviewQuestion _self;
  final $Res Function(_InterviewQuestion) _then;

/// Create a copy of InterviewQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? type = null,Object? focus = null,}) {
  return _then(_InterviewQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CriteriaScores {

 int get structure; int get relevance; int get specificity; int get clarity;
/// Create a copy of CriteriaScores
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CriteriaScoresCopyWith<CriteriaScores> get copyWith => _$CriteriaScoresCopyWithImpl<CriteriaScores>(this as CriteriaScores, _$identity);

  /// Serializes this CriteriaScores to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CriteriaScores;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CriteriaScores&&(identical(other.structure, _this.structure) || other.structure == _this.structure)&&(identical(other.relevance, _this.relevance) || other.relevance == _this.relevance)&&(identical(other.specificity, _this.specificity) || other.specificity == _this.specificity)&&(identical(other.clarity, _this.clarity) || other.clarity == _this.clarity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CriteriaScores;
  return Object.hash(runtimeType,_this.structure,_this.relevance,_this.specificity,_this.clarity);
}

@override
String toString() {
  final _this = this as CriteriaScores;
  return 'CriteriaScores(structure: ${_this.structure}, relevance: ${_this.relevance}, specificity: ${_this.specificity}, clarity: ${_this.clarity})';
}


}

/// @nodoc
abstract mixin class $CriteriaScoresCopyWith<$Res>  {
  factory $CriteriaScoresCopyWith(CriteriaScores value, $Res Function(CriteriaScores) _then) = _$CriteriaScoresCopyWithImpl;
@useResult
$Res call({
 int structure, int relevance, int specificity, int clarity
});




}
/// @nodoc
class _$CriteriaScoresCopyWithImpl<$Res>
    implements $CriteriaScoresCopyWith<$Res> {
  _$CriteriaScoresCopyWithImpl(this._self, this._then);

  final CriteriaScores _self;
  final $Res Function(CriteriaScores) _then;

/// Create a copy of CriteriaScores
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? structure = null,Object? relevance = null,Object? specificity = null,Object? clarity = null,}) {
  return _then(CriteriaScores(
structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as int,relevance: null == relevance ? _self.relevance : relevance // ignore: cast_nullable_to_non_nullable
as int,specificity: null == specificity ? _self.specificity : specificity // ignore: cast_nullable_to_non_nullable
as int,clarity: null == clarity ? _self.clarity : clarity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CriteriaScores].
extension CriteriaScoresPatterns on CriteriaScores {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CriteriaScores value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CriteriaScores() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CriteriaScores value)  $default,){
final _that = this;
switch (_that) {
case _CriteriaScores():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CriteriaScores value)?  $default,){
final _that = this;
switch (_that) {
case _CriteriaScores() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int structure,  int relevance,  int specificity,  int clarity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CriteriaScores() when $default != null:
return $default(_that.structure,_that.relevance,_that.specificity,_that.clarity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int structure,  int relevance,  int specificity,  int clarity)  $default,) {final _that = this;
switch (_that) {
case _CriteriaScores():
return $default(_that.structure,_that.relevance,_that.specificity,_that.clarity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int structure,  int relevance,  int specificity,  int clarity)?  $default,) {final _that = this;
switch (_that) {
case _CriteriaScores() when $default != null:
return $default(_that.structure,_that.relevance,_that.specificity,_that.clarity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CriteriaScores implements CriteriaScores {
  const _CriteriaScores({required this.structure, required this.relevance, required this.specificity, required this.clarity});
  factory _CriteriaScores.fromJson(Map<String, dynamic> json) => _$CriteriaScoresFromJson(json);

@override final  int structure;
@override final  int relevance;
@override final  int specificity;
@override final  int clarity;

/// Create a copy of CriteriaScores
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CriteriaScoresCopyWith<_CriteriaScores> get copyWith => __$CriteriaScoresCopyWithImpl<_CriteriaScores>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CriteriaScoresToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CriteriaScores&&(identical(other.structure, structure) || other.structure == structure)&&(identical(other.relevance, relevance) || other.relevance == relevance)&&(identical(other.specificity, specificity) || other.specificity == specificity)&&(identical(other.clarity, clarity) || other.clarity == clarity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,structure,relevance,specificity,clarity);
}

@override
String toString() {
    return 'CriteriaScores(structure: $structure, relevance: $relevance, specificity: $specificity, clarity: $clarity)';
}


}

/// @nodoc
abstract mixin class _$CriteriaScoresCopyWith<$Res> implements $CriteriaScoresCopyWith<$Res> {
  factory _$CriteriaScoresCopyWith(_CriteriaScores value, $Res Function(_CriteriaScores) _then) = __$CriteriaScoresCopyWithImpl;
@override @useResult
$Res call({
 int structure, int relevance, int specificity, int clarity
});




}
/// @nodoc
class __$CriteriaScoresCopyWithImpl<$Res>
    implements _$CriteriaScoresCopyWith<$Res> {
  __$CriteriaScoresCopyWithImpl(this._self, this._then);

  final _CriteriaScores _self;
  final $Res Function(_CriteriaScores) _then;

/// Create a copy of CriteriaScores
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? structure = null,Object? relevance = null,Object? specificity = null,Object? clarity = null,}) {
  return _then(_CriteriaScores(
structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as int,relevance: null == relevance ? _self.relevance : relevance // ignore: cast_nullable_to_non_nullable
as int,specificity: null == specificity ? _self.specificity : specificity // ignore: cast_nullable_to_non_nullable
as int,clarity: null == clarity ? _self.clarity : clarity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Improvement {

 String get fix; String get quote;
/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImprovementCopyWith<Improvement> get copyWith => _$ImprovementCopyWithImpl<Improvement>(this as Improvement, _$identity);

  /// Serializes this Improvement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Improvement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Improvement&&(identical(other.fix, _this.fix) || other.fix == _this.fix)&&(identical(other.quote, _this.quote) || other.quote == _this.quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Improvement;
  return Object.hash(runtimeType,_this.fix,_this.quote);
}

@override
String toString() {
  final _this = this as Improvement;
  return 'Improvement(fix: ${_this.fix}, quote: ${_this.quote})';
}


}

/// @nodoc
abstract mixin class $ImprovementCopyWith<$Res>  {
  factory $ImprovementCopyWith(Improvement value, $Res Function(Improvement) _then) = _$ImprovementCopyWithImpl;
@useResult
$Res call({
 String fix, String quote
});




}
/// @nodoc
class _$ImprovementCopyWithImpl<$Res>
    implements $ImprovementCopyWith<$Res> {
  _$ImprovementCopyWithImpl(this._self, this._then);

  final Improvement _self;
  final $Res Function(Improvement) _then;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fix = null,Object? quote = null,}) {
  return _then(Improvement(
fix: null == fix ? _self.fix : fix // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Improvement].
extension ImprovementPatterns on Improvement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Improvement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Improvement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Improvement value)  $default,){
final _that = this;
switch (_that) {
case _Improvement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Improvement value)?  $default,){
final _that = this;
switch (_that) {
case _Improvement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fix,  String quote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Improvement() when $default != null:
return $default(_that.fix,_that.quote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fix,  String quote)  $default,) {final _that = this;
switch (_that) {
case _Improvement():
return $default(_that.fix,_that.quote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fix,  String quote)?  $default,) {final _that = this;
switch (_that) {
case _Improvement() when $default != null:
return $default(_that.fix,_that.quote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Improvement implements Improvement {
  const _Improvement({required this.fix, this.quote = ''});
  factory _Improvement.fromJson(Map<String, dynamic> json) => _$ImprovementFromJson(json);

@override final  String fix;
@override@JsonKey() final  String quote;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImprovementCopyWith<_Improvement> get copyWith => __$ImprovementCopyWithImpl<_Improvement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImprovementToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Improvement&&(identical(other.fix, fix) || other.fix == fix)&&(identical(other.quote, quote) || other.quote == quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fix,quote);
}

@override
String toString() {
    return 'Improvement(fix: $fix, quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$ImprovementCopyWith<$Res> implements $ImprovementCopyWith<$Res> {
  factory _$ImprovementCopyWith(_Improvement value, $Res Function(_Improvement) _then) = __$ImprovementCopyWithImpl;
@override @useResult
$Res call({
 String fix, String quote
});




}
/// @nodoc
class __$ImprovementCopyWithImpl<$Res>
    implements _$ImprovementCopyWith<$Res> {
  __$ImprovementCopyWithImpl(this._self, this._then);

  final _Improvement _self;
  final $Res Function(_Improvement) _then;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fix = null,Object? quote = null,}) {
  return _then(_Improvement(
fix: null == fix ? _self.fix : fix // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AnswerFeedback {

 int get score; CriteriaScores get criteria; String get summary; List<String> get strengths; List<Improvement> get improvements; String get improvedAnswer; String get followUpQuestion;
/// Create a copy of AnswerFeedback
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerFeedbackCopyWith<AnswerFeedback> get copyWith => _$AnswerFeedbackCopyWithImpl<AnswerFeedback>(this as AnswerFeedback, _$identity);

  /// Serializes this AnswerFeedback to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AnswerFeedback;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerFeedback&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.criteria, _this.criteria) || other.criteria == _this.criteria)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.strengths, _this.strengths)&&const DeepCollectionEquality().equals(other.improvements, _this.improvements)&&(identical(other.improvedAnswer, _this.improvedAnswer) || other.improvedAnswer == _this.improvedAnswer)&&(identical(other.followUpQuestion, _this.followUpQuestion) || other.followUpQuestion == _this.followUpQuestion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AnswerFeedback;
  return Object.hash(runtimeType,_this.score,_this.criteria,_this.summary,const DeepCollectionEquality().hash(_this.strengths),const DeepCollectionEquality().hash(_this.improvements),_this.improvedAnswer,_this.followUpQuestion);
}

@override
String toString() {
  final _this = this as AnswerFeedback;
  return 'AnswerFeedback(score: ${_this.score}, criteria: ${_this.criteria}, summary: ${_this.summary}, strengths: ${_this.strengths}, improvements: ${_this.improvements}, improvedAnswer: ${_this.improvedAnswer}, followUpQuestion: ${_this.followUpQuestion})';
}


}

/// @nodoc
abstract mixin class $AnswerFeedbackCopyWith<$Res>  {
  factory $AnswerFeedbackCopyWith(AnswerFeedback value, $Res Function(AnswerFeedback) _then) = _$AnswerFeedbackCopyWithImpl;
@useResult
$Res call({
 int score, CriteriaScores criteria, String summary, List<String> strengths, List<Improvement> improvements, String improvedAnswer, String followUpQuestion
});


$CriteriaScoresCopyWith<$Res> get criteria;

}
/// @nodoc
class _$AnswerFeedbackCopyWithImpl<$Res>
    implements $AnswerFeedbackCopyWith<$Res> {
  _$AnswerFeedbackCopyWithImpl(this._self, this._then);

  final AnswerFeedback _self;
  final $Res Function(AnswerFeedback) _then;

/// Create a copy of AnswerFeedback
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? criteria = null,Object? summary = null,Object? strengths = null,Object? improvements = null,Object? improvedAnswer = null,Object? followUpQuestion = null,}) {
  return _then(AnswerFeedback(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as CriteriaScores,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,improvements: null == improvements ? _self.improvements : improvements // ignore: cast_nullable_to_non_nullable
as List<Improvement>,improvedAnswer: null == improvedAnswer ? _self.improvedAnswer : improvedAnswer // ignore: cast_nullable_to_non_nullable
as String,followUpQuestion: null == followUpQuestion ? _self.followUpQuestion : followUpQuestion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AnswerFeedback
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CriteriaScoresCopyWith<$Res> get criteria {
  
  return $CriteriaScoresCopyWith<$Res>(_self.criteria, (value) {
    return _then(_self.copyWith(criteria: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnswerFeedback].
extension AnswerFeedbackPatterns on AnswerFeedback {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnswerFeedback value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnswerFeedback() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnswerFeedback value)  $default,){
final _that = this;
switch (_that) {
case _AnswerFeedback():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnswerFeedback value)?  $default,){
final _that = this;
switch (_that) {
case _AnswerFeedback() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  CriteriaScores criteria,  String summary,  List<String> strengths,  List<Improvement> improvements,  String improvedAnswer,  String followUpQuestion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnswerFeedback() when $default != null:
return $default(_that.score,_that.criteria,_that.summary,_that.strengths,_that.improvements,_that.improvedAnswer,_that.followUpQuestion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  CriteriaScores criteria,  String summary,  List<String> strengths,  List<Improvement> improvements,  String improvedAnswer,  String followUpQuestion)  $default,) {final _that = this;
switch (_that) {
case _AnswerFeedback():
return $default(_that.score,_that.criteria,_that.summary,_that.strengths,_that.improvements,_that.improvedAnswer,_that.followUpQuestion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  CriteriaScores criteria,  String summary,  List<String> strengths,  List<Improvement> improvements,  String improvedAnswer,  String followUpQuestion)?  $default,) {final _that = this;
switch (_that) {
case _AnswerFeedback() when $default != null:
return $default(_that.score,_that.criteria,_that.summary,_that.strengths,_that.improvements,_that.improvedAnswer,_that.followUpQuestion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnswerFeedback implements AnswerFeedback {
  const _AnswerFeedback({required this.score, required this.criteria, required this.summary, required  List<String> strengths, required  List<Improvement> improvements, required this.improvedAnswer, required this.followUpQuestion}): _strengths = strengths,_improvements = improvements;
  factory _AnswerFeedback.fromJson(Map<String, dynamic> json) => _$AnswerFeedbackFromJson(json);

@override final  int score;
@override final  CriteriaScores criteria;
@override final  String summary;
 final  List<String> _strengths;
@override List<String> get strengths {
  if (_strengths is EqualUnmodifiableListView) return _strengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengths);
}

 final  List<Improvement> _improvements;
@override List<Improvement> get improvements {
  if (_improvements is EqualUnmodifiableListView) return _improvements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_improvements);
}

@override final  String improvedAnswer;
@override final  String followUpQuestion;

/// Create a copy of AnswerFeedback
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerFeedbackCopyWith<_AnswerFeedback> get copyWith => __$AnswerFeedbackCopyWithImpl<_AnswerFeedback>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerFeedbackToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerFeedback&&(identical(other.score, score) || other.score == score)&&(identical(other.criteria, criteria) || other.criteria == criteria)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.strengths, _strengths)&&const DeepCollectionEquality().equals(other.improvements, _improvements)&&(identical(other.improvedAnswer, improvedAnswer) || other.improvedAnswer == improvedAnswer)&&(identical(other.followUpQuestion, followUpQuestion) || other.followUpQuestion == followUpQuestion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,score,criteria,summary,const DeepCollectionEquality().hash(_strengths),const DeepCollectionEquality().hash(_improvements),improvedAnswer,followUpQuestion);
}

@override
String toString() {
    return 'AnswerFeedback(score: $score, criteria: $criteria, summary: $summary, strengths: $strengths, improvements: $improvements, improvedAnswer: $improvedAnswer, followUpQuestion: $followUpQuestion)';
}


}

/// @nodoc
abstract mixin class _$AnswerFeedbackCopyWith<$Res> implements $AnswerFeedbackCopyWith<$Res> {
  factory _$AnswerFeedbackCopyWith(_AnswerFeedback value, $Res Function(_AnswerFeedback) _then) = __$AnswerFeedbackCopyWithImpl;
@override @useResult
$Res call({
 int score, CriteriaScores criteria, String summary, List<String> strengths, List<Improvement> improvements, String improvedAnswer, String followUpQuestion
});


@override $CriteriaScoresCopyWith<$Res> get criteria;

}
/// @nodoc
class __$AnswerFeedbackCopyWithImpl<$Res>
    implements _$AnswerFeedbackCopyWith<$Res> {
  __$AnswerFeedbackCopyWithImpl(this._self, this._then);

  final _AnswerFeedback _self;
  final $Res Function(_AnswerFeedback) _then;

/// Create a copy of AnswerFeedback
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? criteria = null,Object? summary = null,Object? strengths = null,Object? improvements = null,Object? improvedAnswer = null,Object? followUpQuestion = null,}) {
  return _then(_AnswerFeedback(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as CriteriaScores,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self._strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,improvements: null == improvements ? _self._improvements : improvements // ignore: cast_nullable_to_non_nullable
as List<Improvement>,improvedAnswer: null == improvedAnswer ? _self.improvedAnswer : improvedAnswer // ignore: cast_nullable_to_non_nullable
as String,followUpQuestion: null == followUpQuestion ? _self.followUpQuestion : followUpQuestion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AnswerFeedback
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CriteriaScoresCopyWith<$Res> get criteria {
  
  return $CriteriaScoresCopyWith<$Res>(_self.criteria, (value) {
    return _then(_self.copyWith(criteria: value));
  });
}
}


/// @nodoc
mixin _$InterviewAnswer {

 String get questionId; String get transcript; AnswerInputMode get inputMode; AnswerFeedback get feedback; int? get durationSeconds; int? get fillerWordCount;
/// Create a copy of InterviewAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewAnswerCopyWith<InterviewAnswer> get copyWith => _$InterviewAnswerCopyWithImpl<InterviewAnswer>(this as InterviewAnswer, _$identity);

  /// Serializes this InterviewAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InterviewAnswer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewAnswer&&(identical(other.questionId, _this.questionId) || other.questionId == _this.questionId)&&(identical(other.transcript, _this.transcript) || other.transcript == _this.transcript)&&(identical(other.inputMode, _this.inputMode) || other.inputMode == _this.inputMode)&&(identical(other.feedback, _this.feedback) || other.feedback == _this.feedback)&&(identical(other.durationSeconds, _this.durationSeconds) || other.durationSeconds == _this.durationSeconds)&&(identical(other.fillerWordCount, _this.fillerWordCount) || other.fillerWordCount == _this.fillerWordCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InterviewAnswer;
  return Object.hash(runtimeType,_this.questionId,_this.transcript,_this.inputMode,_this.feedback,_this.durationSeconds,_this.fillerWordCount);
}

@override
String toString() {
  final _this = this as InterviewAnswer;
  return 'InterviewAnswer(questionId: ${_this.questionId}, transcript: ${_this.transcript}, inputMode: ${_this.inputMode}, feedback: ${_this.feedback}, durationSeconds: ${_this.durationSeconds}, fillerWordCount: ${_this.fillerWordCount})';
}


}

/// @nodoc
abstract mixin class $InterviewAnswerCopyWith<$Res>  {
  factory $InterviewAnswerCopyWith(InterviewAnswer value, $Res Function(InterviewAnswer) _then) = _$InterviewAnswerCopyWithImpl;
@useResult
$Res call({
 String questionId, String transcript, AnswerInputMode inputMode, AnswerFeedback feedback, int? durationSeconds, int? fillerWordCount
});


$AnswerFeedbackCopyWith<$Res> get feedback;

}
/// @nodoc
class _$InterviewAnswerCopyWithImpl<$Res>
    implements $InterviewAnswerCopyWith<$Res> {
  _$InterviewAnswerCopyWithImpl(this._self, this._then);

  final InterviewAnswer _self;
  final $Res Function(InterviewAnswer) _then;

/// Create a copy of InterviewAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? transcript = null,Object? inputMode = null,Object? feedback = null,Object? durationSeconds = freezed,Object? fillerWordCount = freezed,}) {
  return _then(InterviewAnswer(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,inputMode: null == inputMode ? _self.inputMode : inputMode // ignore: cast_nullable_to_non_nullable
as AnswerInputMode,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as AnswerFeedback,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,fillerWordCount: freezed == fillerWordCount ? _self.fillerWordCount : fillerWordCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of InterviewAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnswerFeedbackCopyWith<$Res> get feedback {
  
  return $AnswerFeedbackCopyWith<$Res>(_self.feedback, (value) {
    return _then(_self.copyWith(feedback: value));
  });
}
}


/// Adds pattern-matching-related methods to [InterviewAnswer].
extension InterviewAnswerPatterns on InterviewAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewAnswer value)  $default,){
final _that = this;
switch (_that) {
case _InterviewAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionId,  String transcript,  AnswerInputMode inputMode,  AnswerFeedback feedback,  int? durationSeconds,  int? fillerWordCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewAnswer() when $default != null:
return $default(_that.questionId,_that.transcript,_that.inputMode,_that.feedback,_that.durationSeconds,_that.fillerWordCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionId,  String transcript,  AnswerInputMode inputMode,  AnswerFeedback feedback,  int? durationSeconds,  int? fillerWordCount)  $default,) {final _that = this;
switch (_that) {
case _InterviewAnswer():
return $default(_that.questionId,_that.transcript,_that.inputMode,_that.feedback,_that.durationSeconds,_that.fillerWordCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionId,  String transcript,  AnswerInputMode inputMode,  AnswerFeedback feedback,  int? durationSeconds,  int? fillerWordCount)?  $default,) {final _that = this;
switch (_that) {
case _InterviewAnswer() when $default != null:
return $default(_that.questionId,_that.transcript,_that.inputMode,_that.feedback,_that.durationSeconds,_that.fillerWordCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewAnswer implements InterviewAnswer {
  const _InterviewAnswer({required this.questionId, required this.transcript, required this.inputMode, required this.feedback, this.durationSeconds, this.fillerWordCount});
  factory _InterviewAnswer.fromJson(Map<String, dynamic> json) => _$InterviewAnswerFromJson(json);

@override final  String questionId;
@override final  String transcript;
@override final  AnswerInputMode inputMode;
@override final  AnswerFeedback feedback;
@override final  int? durationSeconds;
@override final  int? fillerWordCount;

/// Create a copy of InterviewAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewAnswerCopyWith<_InterviewAnswer> get copyWith => __$InterviewAnswerCopyWithImpl<_InterviewAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewAnswer&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.transcript, transcript) || other.transcript == transcript)&&(identical(other.inputMode, inputMode) || other.inputMode == inputMode)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.fillerWordCount, fillerWordCount) || other.fillerWordCount == fillerWordCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,questionId,transcript,inputMode,feedback,durationSeconds,fillerWordCount);
}

@override
String toString() {
    return 'InterviewAnswer(questionId: $questionId, transcript: $transcript, inputMode: $inputMode, feedback: $feedback, durationSeconds: $durationSeconds, fillerWordCount: $fillerWordCount)';
}


}

/// @nodoc
abstract mixin class _$InterviewAnswerCopyWith<$Res> implements $InterviewAnswerCopyWith<$Res> {
  factory _$InterviewAnswerCopyWith(_InterviewAnswer value, $Res Function(_InterviewAnswer) _then) = __$InterviewAnswerCopyWithImpl;
@override @useResult
$Res call({
 String questionId, String transcript, AnswerInputMode inputMode, AnswerFeedback feedback, int? durationSeconds, int? fillerWordCount
});


@override $AnswerFeedbackCopyWith<$Res> get feedback;

}
/// @nodoc
class __$InterviewAnswerCopyWithImpl<$Res>
    implements _$InterviewAnswerCopyWith<$Res> {
  __$InterviewAnswerCopyWithImpl(this._self, this._then);

  final _InterviewAnswer _self;
  final $Res Function(_InterviewAnswer) _then;

/// Create a copy of InterviewAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? transcript = null,Object? inputMode = null,Object? feedback = null,Object? durationSeconds = freezed,Object? fillerWordCount = freezed,}) {
  return _then(_InterviewAnswer(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,inputMode: null == inputMode ? _self.inputMode : inputMode // ignore: cast_nullable_to_non_nullable
as AnswerInputMode,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as AnswerFeedback,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,fillerWordCount: freezed == fillerWordCount ? _self.fillerWordCount : fillerWordCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of InterviewAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnswerFeedbackCopyWith<$Res> get feedback {
  
  return $AnswerFeedbackCopyWith<$Res>(_self.feedback, (value) {
    return _then(_self.copyWith(feedback: value));
  });
}
}


/// @nodoc
mixin _$InterviewSession {

 String get id; DateTime get createdAt; String get targetRole; Seniority get seniority; InterviewLanguage get language; String get roleSummary; List<InterviewQuestion> get questions; String get jobPosting; List<InterviewAnswer> get answers;
/// Create a copy of InterviewSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewSessionCopyWith<InterviewSession> get copyWith => _$InterviewSessionCopyWithImpl<InterviewSession>(this as InterviewSession, _$identity);

  /// Serializes this InterviewSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InterviewSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.targetRole, _this.targetRole) || other.targetRole == _this.targetRole)&&(identical(other.seniority, _this.seniority) || other.seniority == _this.seniority)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.roleSummary, _this.roleSummary) || other.roleSummary == _this.roleSummary)&&const DeepCollectionEquality().equals(other.questions, _this.questions)&&(identical(other.jobPosting, _this.jobPosting) || other.jobPosting == _this.jobPosting)&&const DeepCollectionEquality().equals(other.answers, _this.answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InterviewSession;
  return Object.hash(runtimeType,_this.id,_this.createdAt,_this.targetRole,_this.seniority,_this.language,_this.roleSummary,const DeepCollectionEquality().hash(_this.questions),_this.jobPosting,const DeepCollectionEquality().hash(_this.answers));
}

@override
String toString() {
  final _this = this as InterviewSession;
  return 'InterviewSession(id: ${_this.id}, createdAt: ${_this.createdAt}, targetRole: ${_this.targetRole}, seniority: ${_this.seniority}, language: ${_this.language}, roleSummary: ${_this.roleSummary}, questions: ${_this.questions}, jobPosting: ${_this.jobPosting}, answers: ${_this.answers})';
}


}

/// @nodoc
abstract mixin class $InterviewSessionCopyWith<$Res>  {
  factory $InterviewSessionCopyWith(InterviewSession value, $Res Function(InterviewSession) _then) = _$InterviewSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, String targetRole, Seniority seniority, InterviewLanguage language, String roleSummary, List<InterviewQuestion> questions, String jobPosting, List<InterviewAnswer> answers
});




}
/// @nodoc
class _$InterviewSessionCopyWithImpl<$Res>
    implements $InterviewSessionCopyWith<$Res> {
  _$InterviewSessionCopyWithImpl(this._self, this._then);

  final InterviewSession _self;
  final $Res Function(InterviewSession) _then;

/// Create a copy of InterviewSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? targetRole = null,Object? seniority = null,Object? language = null,Object? roleSummary = null,Object? questions = null,Object? jobPosting = null,Object? answers = null,}) {
  return _then(InterviewSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,targetRole: null == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String,seniority: null == seniority ? _self.seniority : seniority // ignore: cast_nullable_to_non_nullable
as Seniority,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as InterviewLanguage,roleSummary: null == roleSummary ? _self.roleSummary : roleSummary // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<InterviewQuestion>,jobPosting: null == jobPosting ? _self.jobPosting : jobPosting // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<InterviewAnswer>,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewSession].
extension InterviewSessionPatterns on InterviewSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewSession value)  $default,){
final _that = this;
switch (_that) {
case _InterviewSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewSession value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  String targetRole,  Seniority seniority,  InterviewLanguage language,  String roleSummary,  List<InterviewQuestion> questions,  String jobPosting,  List<InterviewAnswer> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewSession() when $default != null:
return $default(_that.id,_that.createdAt,_that.targetRole,_that.seniority,_that.language,_that.roleSummary,_that.questions,_that.jobPosting,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  String targetRole,  Seniority seniority,  InterviewLanguage language,  String roleSummary,  List<InterviewQuestion> questions,  String jobPosting,  List<InterviewAnswer> answers)  $default,) {final _that = this;
switch (_that) {
case _InterviewSession():
return $default(_that.id,_that.createdAt,_that.targetRole,_that.seniority,_that.language,_that.roleSummary,_that.questions,_that.jobPosting,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  String targetRole,  Seniority seniority,  InterviewLanguage language,  String roleSummary,  List<InterviewQuestion> questions,  String jobPosting,  List<InterviewAnswer> answers)?  $default,) {final _that = this;
switch (_that) {
case _InterviewSession() when $default != null:
return $default(_that.id,_that.createdAt,_that.targetRole,_that.seniority,_that.language,_that.roleSummary,_that.questions,_that.jobPosting,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewSession extends InterviewSession {
  const _InterviewSession({required this.id, required this.createdAt, required this.targetRole, required this.seniority, required this.language, required this.roleSummary, required  List<InterviewQuestion> questions, this.jobPosting = '',  List<InterviewAnswer> answers = const []}): _questions = questions,_answers = answers,super._();
  factory _InterviewSession.fromJson(Map<String, dynamic> json) => _$InterviewSessionFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  String targetRole;
@override final  Seniority seniority;
@override final  InterviewLanguage language;
@override final  String roleSummary;
 final  List<InterviewQuestion> _questions;
@override List<InterviewQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override@JsonKey() final  String jobPosting;
 final  List<InterviewAnswer> _answers;
@override@JsonKey() List<InterviewAnswer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of InterviewSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewSessionCopyWith<_InterviewSession> get copyWith => __$InterviewSessionCopyWithImpl<_InterviewSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewSessionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewSession&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole)&&(identical(other.seniority, seniority) || other.seniority == seniority)&&(identical(other.language, language) || other.language == language)&&(identical(other.roleSummary, roleSummary) || other.roleSummary == roleSummary)&&const DeepCollectionEquality().equals(other.questions, _questions)&&(identical(other.jobPosting, jobPosting) || other.jobPosting == jobPosting)&&const DeepCollectionEquality().equals(other.answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,createdAt,targetRole,seniority,language,roleSummary,const DeepCollectionEquality().hash(_questions),jobPosting,const DeepCollectionEquality().hash(_answers));
}

@override
String toString() {
    return 'InterviewSession(id: $id, createdAt: $createdAt, targetRole: $targetRole, seniority: $seniority, language: $language, roleSummary: $roleSummary, questions: $questions, jobPosting: $jobPosting, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$InterviewSessionCopyWith<$Res> implements $InterviewSessionCopyWith<$Res> {
  factory _$InterviewSessionCopyWith(_InterviewSession value, $Res Function(_InterviewSession) _then) = __$InterviewSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, String targetRole, Seniority seniority, InterviewLanguage language, String roleSummary, List<InterviewQuestion> questions, String jobPosting, List<InterviewAnswer> answers
});




}
/// @nodoc
class __$InterviewSessionCopyWithImpl<$Res>
    implements _$InterviewSessionCopyWith<$Res> {
  __$InterviewSessionCopyWithImpl(this._self, this._then);

  final _InterviewSession _self;
  final $Res Function(_InterviewSession) _then;

/// Create a copy of InterviewSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? targetRole = null,Object? seniority = null,Object? language = null,Object? roleSummary = null,Object? questions = null,Object? jobPosting = null,Object? answers = null,}) {
  return _then(_InterviewSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,targetRole: null == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String,seniority: null == seniority ? _self.seniority : seniority // ignore: cast_nullable_to_non_nullable
as Seniority,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as InterviewLanguage,roleSummary: null == roleSummary ? _self.roleSummary : roleSummary // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<InterviewQuestion>,jobPosting: null == jobPosting ? _self.jobPosting : jobPosting // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<InterviewAnswer>,
  ));
}


}

// dart format on
