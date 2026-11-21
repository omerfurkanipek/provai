// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultEffect {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResultEffect()';
}


}

/// @nodoc
class $ResultEffectCopyWith<$Res>  {
$ResultEffectCopyWith(ResultEffect _, $Res Function(ResultEffect) __);
}


/// Adds pattern-matching-related methods to [ResultEffect].
extension ResultEffectPatterns on ResultEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResultEffectOpenSession value)?  openSession,TResult Function( ResultEffectOpenPaywall value)?  openPaywall,TResult Function( ResultEffectShowError value)?  showError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResultEffectOpenSession() when openSession != null:
return openSession(_that);case ResultEffectOpenPaywall() when openPaywall != null:
return openPaywall(_that);case ResultEffectShowError() when showError != null:
return showError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResultEffectOpenSession value)  openSession,required TResult Function( ResultEffectOpenPaywall value)  openPaywall,required TResult Function( ResultEffectShowError value)  showError,}){
final _that = this;
switch (_that) {
case ResultEffectOpenSession():
return openSession(_that);case ResultEffectOpenPaywall():
return openPaywall(_that);case ResultEffectShowError():
return showError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResultEffectOpenSession value)?  openSession,TResult? Function( ResultEffectOpenPaywall value)?  openPaywall,TResult? Function( ResultEffectShowError value)?  showError,}){
final _that = this;
switch (_that) {
case ResultEffectOpenSession() when openSession != null:
return openSession(_that);case ResultEffectOpenPaywall() when openPaywall != null:
return openPaywall(_that);case ResultEffectShowError() when showError != null:
return showError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String sessionId)?  openSession,TResult Function()?  openPaywall,TResult Function( AppException error)?  showError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResultEffectOpenSession() when openSession != null:
return openSession(_that.sessionId);case ResultEffectOpenPaywall() when openPaywall != null:
return openPaywall();case ResultEffectShowError() when showError != null:
return showError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String sessionId)  openSession,required TResult Function()  openPaywall,required TResult Function( AppException error)  showError,}) {final _that = this;
switch (_that) {
case ResultEffectOpenSession():
return openSession(_that.sessionId);case ResultEffectOpenPaywall():
return openPaywall();case ResultEffectShowError():
return showError(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String sessionId)?  openSession,TResult? Function()?  openPaywall,TResult? Function( AppException error)?  showError,}) {final _that = this;
switch (_that) {
case ResultEffectOpenSession() when openSession != null:
return openSession(_that.sessionId);case ResultEffectOpenPaywall() when openPaywall != null:
return openPaywall();case ResultEffectShowError() when showError != null:
return showError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ResultEffectOpenSession implements ResultEffect {
  const ResultEffectOpenSession(this.sessionId);
  

 final  String sessionId;

/// Create a copy of ResultEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultEffectOpenSessionCopyWith<ResultEffectOpenSession> get copyWith => _$ResultEffectOpenSessionCopyWithImpl<ResultEffectOpenSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultEffectOpenSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sessionId);
}

@override
String toString() {
    return 'ResultEffect.openSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $ResultEffectOpenSessionCopyWith<$Res> implements $ResultEffectCopyWith<$Res> {
  factory $ResultEffectOpenSessionCopyWith(ResultEffectOpenSession value, $Res Function(ResultEffectOpenSession) _then) = _$ResultEffectOpenSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$ResultEffectOpenSessionCopyWithImpl<$Res>
    implements $ResultEffectOpenSessionCopyWith<$Res> {
  _$ResultEffectOpenSessionCopyWithImpl(this._self, this._then);

  final ResultEffectOpenSession _self;
  final $Res Function(ResultEffectOpenSession) _then;

/// Create a copy of ResultEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(ResultEffectOpenSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResultEffectOpenPaywall implements ResultEffect {
  const ResultEffectOpenPaywall();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultEffectOpenPaywall);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResultEffect.openPaywall()';
}


}




/// @nodoc


class ResultEffectShowError implements ResultEffect {
  const ResultEffectShowError(this.error);
  

 final  AppException error;

/// Create a copy of ResultEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultEffectShowErrorCopyWith<ResultEffectShowError> get copyWith => _$ResultEffectShowErrorCopyWithImpl<ResultEffectShowError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultEffectShowError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'ResultEffect.showError(error: $error)';
}


}

/// @nodoc
abstract mixin class $ResultEffectShowErrorCopyWith<$Res> implements $ResultEffectCopyWith<$Res> {
  factory $ResultEffectShowErrorCopyWith(ResultEffectShowError value, $Res Function(ResultEffectShowError) _then) = _$ResultEffectShowErrorCopyWithImpl;
@useResult
$Res call({
 AppException error
});




}
/// @nodoc
class _$ResultEffectShowErrorCopyWithImpl<$Res>
    implements $ResultEffectShowErrorCopyWith<$Res> {
  _$ResultEffectShowErrorCopyWithImpl(this._self, this._then);

  final ResultEffectShowError _self;
  final $Res Function(ResultEffectShowError) _then;

/// Create a copy of ResultEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ResultEffectShowError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

/// @nodoc
mixin _$ResultState {

 InterviewSession? get session; bool get isRetrying; ResultEffect? get effect;
/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultStateCopyWith<ResultState> get copyWith => _$ResultStateCopyWithImpl<ResultState>(this as ResultState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResultState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultState&&(identical(other.session, _this.session) || other.session == _this.session)&&(identical(other.isRetrying, _this.isRetrying) || other.isRetrying == _this.isRetrying)&&(identical(other.effect, _this.effect) || other.effect == _this.effect));
}


@override
int get hashCode {
  final _this = this as ResultState;
  return Object.hash(runtimeType,_this.session,_this.isRetrying,_this.effect);
}

@override
String toString() {
  final _this = this as ResultState;
  return 'ResultState(session: ${_this.session}, isRetrying: ${_this.isRetrying}, effect: ${_this.effect})';
}


}

/// @nodoc
abstract mixin class $ResultStateCopyWith<$Res>  {
  factory $ResultStateCopyWith(ResultState value, $Res Function(ResultState) _then) = _$ResultStateCopyWithImpl;
@useResult
$Res call({
 InterviewSession? session, bool isRetrying, ResultEffect? effect
});


$InterviewSessionCopyWith<$Res>? get session;$ResultEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ResultStateCopyWithImpl<$Res>
    implements $ResultStateCopyWith<$Res> {
  _$ResultStateCopyWithImpl(this._self, this._then);

  final ResultState _self;
  final $Res Function(ResultState) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = freezed,Object? isRetrying = null,Object? effect = freezed,}) {
  return _then(ResultState(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as InterviewSession?,isRetrying: null == isRetrying ? _self.isRetrying : isRetrying // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ResultEffect?,
  ));
}
/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $InterviewSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ResultEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResultState].
extension ResultStatePatterns on ResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultState value)  $default,){
final _that = this;
switch (_that) {
case _ResultState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultState value)?  $default,){
final _that = this;
switch (_that) {
case _ResultState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InterviewSession? session,  bool isRetrying,  ResultEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultState() when $default != null:
return $default(_that.session,_that.isRetrying,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InterviewSession? session,  bool isRetrying,  ResultEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ResultState():
return $default(_that.session,_that.isRetrying,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InterviewSession? session,  bool isRetrying,  ResultEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ResultState() when $default != null:
return $default(_that.session,_that.isRetrying,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ResultState extends ResultState {
  const _ResultState({required this.session, this.isRetrying = false, this.effect}): super._();
  

@override final  InterviewSession? session;
@override@JsonKey() final  bool isRetrying;
@override final  ResultEffect? effect;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultStateCopyWith<_ResultState> get copyWith => __$ResultStateCopyWithImpl<_ResultState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultState&&(identical(other.session, session) || other.session == session)&&(identical(other.isRetrying, isRetrying) || other.isRetrying == isRetrying)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session,isRetrying,effect);
}

@override
String toString() {
    return 'ResultState(session: $session, isRetrying: $isRetrying, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ResultStateCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$ResultStateCopyWith(_ResultState value, $Res Function(_ResultState) _then) = __$ResultStateCopyWithImpl;
@override @useResult
$Res call({
 InterviewSession? session, bool isRetrying, ResultEffect? effect
});


@override $InterviewSessionCopyWith<$Res>? get session;@override $ResultEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ResultStateCopyWithImpl<$Res>
    implements _$ResultStateCopyWith<$Res> {
  __$ResultStateCopyWithImpl(this._self, this._then);

  final _ResultState _self;
  final $Res Function(_ResultState) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? isRetrying = null,Object? effect = freezed,}) {
  return _then(_ResultState(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as InterviewSession?,isRetrying: null == isRetrying ? _self.isRetrying : isRetrying // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ResultEffect?,
  ));
}

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $InterviewSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ResultEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
