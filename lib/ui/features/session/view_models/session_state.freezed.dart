// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionEffect {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionEffect()';
}


}

/// @nodoc
class $SessionEffectCopyWith<$Res>  {
$SessionEffectCopyWith(SessionEffect _, $Res Function(SessionEffect) __);
}


/// Adds pattern-matching-related methods to [SessionEffect].
extension SessionEffectPatterns on SessionEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionEffectShowError value)?  showError,TResult Function( SessionEffectOpenResult value)?  openResult,TResult Function( SessionEffectOpenPaywall value)?  openPaywall,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionEffectShowError() when showError != null:
return showError(_that);case SessionEffectOpenResult() when openResult != null:
return openResult(_that);case SessionEffectOpenPaywall() when openPaywall != null:
return openPaywall(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionEffectShowError value)  showError,required TResult Function( SessionEffectOpenResult value)  openResult,required TResult Function( SessionEffectOpenPaywall value)  openPaywall,}){
final _that = this;
switch (_that) {
case SessionEffectShowError():
return showError(_that);case SessionEffectOpenResult():
return openResult(_that);case SessionEffectOpenPaywall():
return openPaywall(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionEffectShowError value)?  showError,TResult? Function( SessionEffectOpenResult value)?  openResult,TResult? Function( SessionEffectOpenPaywall value)?  openPaywall,}){
final _that = this;
switch (_that) {
case SessionEffectShowError() when showError != null:
return showError(_that);case SessionEffectOpenResult() when openResult != null:
return openResult(_that);case SessionEffectOpenPaywall() when openPaywall != null:
return openPaywall(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppException error)?  showError,TResult Function( String sessionId)?  openResult,TResult Function()?  openPaywall,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionEffectShowError() when showError != null:
return showError(_that.error);case SessionEffectOpenResult() when openResult != null:
return openResult(_that.sessionId);case SessionEffectOpenPaywall() when openPaywall != null:
return openPaywall();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppException error)  showError,required TResult Function( String sessionId)  openResult,required TResult Function()  openPaywall,}) {final _that = this;
switch (_that) {
case SessionEffectShowError():
return showError(_that.error);case SessionEffectOpenResult():
return openResult(_that.sessionId);case SessionEffectOpenPaywall():
return openPaywall();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppException error)?  showError,TResult? Function( String sessionId)?  openResult,TResult? Function()?  openPaywall,}) {final _that = this;
switch (_that) {
case SessionEffectShowError() when showError != null:
return showError(_that.error);case SessionEffectOpenResult() when openResult != null:
return openResult(_that.sessionId);case SessionEffectOpenPaywall() when openPaywall != null:
return openPaywall();case _:
  return null;

}
}

}

/// @nodoc


class SessionEffectShowError implements SessionEffect {
  const SessionEffectShowError(this.error);
  

 final  AppException error;

/// Create a copy of SessionEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEffectShowErrorCopyWith<SessionEffectShowError> get copyWith => _$SessionEffectShowErrorCopyWithImpl<SessionEffectShowError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEffectShowError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'SessionEffect.showError(error: $error)';
}


}

/// @nodoc
abstract mixin class $SessionEffectShowErrorCopyWith<$Res> implements $SessionEffectCopyWith<$Res> {
  factory $SessionEffectShowErrorCopyWith(SessionEffectShowError value, $Res Function(SessionEffectShowError) _then) = _$SessionEffectShowErrorCopyWithImpl;
@useResult
$Res call({
 AppException error
});




}
/// @nodoc
class _$SessionEffectShowErrorCopyWithImpl<$Res>
    implements $SessionEffectShowErrorCopyWith<$Res> {
  _$SessionEffectShowErrorCopyWithImpl(this._self, this._then);

  final SessionEffectShowError _self;
  final $Res Function(SessionEffectShowError) _then;

/// Create a copy of SessionEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SessionEffectShowError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

/// @nodoc


class SessionEffectOpenResult implements SessionEffect {
  const SessionEffectOpenResult(this.sessionId);
  

 final  String sessionId;

/// Create a copy of SessionEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEffectOpenResultCopyWith<SessionEffectOpenResult> get copyWith => _$SessionEffectOpenResultCopyWithImpl<SessionEffectOpenResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEffectOpenResult&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sessionId);
}

@override
String toString() {
    return 'SessionEffect.openResult(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $SessionEffectOpenResultCopyWith<$Res> implements $SessionEffectCopyWith<$Res> {
  factory $SessionEffectOpenResultCopyWith(SessionEffectOpenResult value, $Res Function(SessionEffectOpenResult) _then) = _$SessionEffectOpenResultCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$SessionEffectOpenResultCopyWithImpl<$Res>
    implements $SessionEffectOpenResultCopyWith<$Res> {
  _$SessionEffectOpenResultCopyWithImpl(this._self, this._then);

  final SessionEffectOpenResult _self;
  final $Res Function(SessionEffectOpenResult) _then;

/// Create a copy of SessionEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(SessionEffectOpenResult(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SessionEffectOpenPaywall implements SessionEffect {
  const SessionEffectOpenPaywall();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEffectOpenPaywall);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionEffect.openPaywall()';
}


}




/// @nodoc
mixin _$SessionState {

 InterviewSession? get session; int get currentIndex; SessionPhase get phase; AnswerInputMode get inputMode; RecordingState get recording; MicAvailability get mic; String get committedTranscript; String get partialTranscript; String get typedAnswer; int get elapsedSeconds; bool get isPro; SessionEffect? get effect;
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStateCopyWith<SessionState> get copyWith => _$SessionStateCopyWithImpl<SessionState>(this as SessionState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState&&(identical(other.session, _this.session) || other.session == _this.session)&&(identical(other.currentIndex, _this.currentIndex) || other.currentIndex == _this.currentIndex)&&(identical(other.phase, _this.phase) || other.phase == _this.phase)&&(identical(other.inputMode, _this.inputMode) || other.inputMode == _this.inputMode)&&(identical(other.recording, _this.recording) || other.recording == _this.recording)&&(identical(other.mic, _this.mic) || other.mic == _this.mic)&&(identical(other.committedTranscript, _this.committedTranscript) || other.committedTranscript == _this.committedTranscript)&&(identical(other.partialTranscript, _this.partialTranscript) || other.partialTranscript == _this.partialTranscript)&&(identical(other.typedAnswer, _this.typedAnswer) || other.typedAnswer == _this.typedAnswer)&&(identical(other.elapsedSeconds, _this.elapsedSeconds) || other.elapsedSeconds == _this.elapsedSeconds)&&(identical(other.isPro, _this.isPro) || other.isPro == _this.isPro)&&(identical(other.effect, _this.effect) || other.effect == _this.effect));
}


@override
int get hashCode {
  final _this = this as SessionState;
  return Object.hash(runtimeType,_this.session,_this.currentIndex,_this.phase,_this.inputMode,_this.recording,_this.mic,_this.committedTranscript,_this.partialTranscript,_this.typedAnswer,_this.elapsedSeconds,_this.isPro,_this.effect);
}

@override
String toString() {
  final _this = this as SessionState;
  return 'SessionState(session: ${_this.session}, currentIndex: ${_this.currentIndex}, phase: ${_this.phase}, inputMode: ${_this.inputMode}, recording: ${_this.recording}, mic: ${_this.mic}, committedTranscript: ${_this.committedTranscript}, partialTranscript: ${_this.partialTranscript}, typedAnswer: ${_this.typedAnswer}, elapsedSeconds: ${_this.elapsedSeconds}, isPro: ${_this.isPro}, effect: ${_this.effect})';
}


}

/// @nodoc
abstract mixin class $SessionStateCopyWith<$Res>  {
  factory $SessionStateCopyWith(SessionState value, $Res Function(SessionState) _then) = _$SessionStateCopyWithImpl;
@useResult
$Res call({
 InterviewSession? session, int currentIndex, SessionPhase phase, AnswerInputMode inputMode, RecordingState recording, MicAvailability mic, String committedTranscript, String partialTranscript, String typedAnswer, int elapsedSeconds, bool isPro, SessionEffect? effect
});


$InterviewSessionCopyWith<$Res>? get session;$SessionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$SessionStateCopyWithImpl<$Res>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._self, this._then);

  final SessionState _self;
  final $Res Function(SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = freezed,Object? currentIndex = null,Object? phase = null,Object? inputMode = null,Object? recording = null,Object? mic = null,Object? committedTranscript = null,Object? partialTranscript = null,Object? typedAnswer = null,Object? elapsedSeconds = null,Object? isPro = null,Object? effect = freezed,}) {
  return _then(SessionState(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as InterviewSession?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as SessionPhase,inputMode: null == inputMode ? _self.inputMode : inputMode // ignore: cast_nullable_to_non_nullable
as AnswerInputMode,recording: null == recording ? _self.recording : recording // ignore: cast_nullable_to_non_nullable
as RecordingState,mic: null == mic ? _self.mic : mic // ignore: cast_nullable_to_non_nullable
as MicAvailability,committedTranscript: null == committedTranscript ? _self.committedTranscript : committedTranscript // ignore: cast_nullable_to_non_nullable
as String,partialTranscript: null == partialTranscript ? _self.partialTranscript : partialTranscript // ignore: cast_nullable_to_non_nullable
as String,typedAnswer: null == typedAnswer ? _self.typedAnswer : typedAnswer // ignore: cast_nullable_to_non_nullable
as String,elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,isPro: null == isPro ? _self.isPro : isPro // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as SessionEffect?,
  ));
}
/// Create a copy of SessionState
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
}/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $SessionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionState value)  $default,){
final _that = this;
switch (_that) {
case _SessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionState value)?  $default,){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InterviewSession? session,  int currentIndex,  SessionPhase phase,  AnswerInputMode inputMode,  RecordingState recording,  MicAvailability mic,  String committedTranscript,  String partialTranscript,  String typedAnswer,  int elapsedSeconds,  bool isPro,  SessionEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.session,_that.currentIndex,_that.phase,_that.inputMode,_that.recording,_that.mic,_that.committedTranscript,_that.partialTranscript,_that.typedAnswer,_that.elapsedSeconds,_that.isPro,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InterviewSession? session,  int currentIndex,  SessionPhase phase,  AnswerInputMode inputMode,  RecordingState recording,  MicAvailability mic,  String committedTranscript,  String partialTranscript,  String typedAnswer,  int elapsedSeconds,  bool isPro,  SessionEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _SessionState():
return $default(_that.session,_that.currentIndex,_that.phase,_that.inputMode,_that.recording,_that.mic,_that.committedTranscript,_that.partialTranscript,_that.typedAnswer,_that.elapsedSeconds,_that.isPro,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InterviewSession? session,  int currentIndex,  SessionPhase phase,  AnswerInputMode inputMode,  RecordingState recording,  MicAvailability mic,  String committedTranscript,  String partialTranscript,  String typedAnswer,  int elapsedSeconds,  bool isPro,  SessionEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.session,_that.currentIndex,_that.phase,_that.inputMode,_that.recording,_that.mic,_that.committedTranscript,_that.partialTranscript,_that.typedAnswer,_that.elapsedSeconds,_that.isPro,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _SessionState extends SessionState {
  const _SessionState({required this.session, this.currentIndex = 0, this.phase = SessionPhase.answering, this.inputMode = AnswerInputMode.voice, this.recording = RecordingState.idle, this.mic = MicAvailability.unknown, this.committedTranscript = '', this.partialTranscript = '', this.typedAnswer = '', this.elapsedSeconds = 0, this.isPro = false, this.effect}): super._();
  

@override final  InterviewSession? session;
@override@JsonKey() final  int currentIndex;
@override@JsonKey() final  SessionPhase phase;
@override@JsonKey() final  AnswerInputMode inputMode;
@override@JsonKey() final  RecordingState recording;
@override@JsonKey() final  MicAvailability mic;
@override@JsonKey() final  String committedTranscript;
@override@JsonKey() final  String partialTranscript;
@override@JsonKey() final  String typedAnswer;
@override@JsonKey() final  int elapsedSeconds;
@override@JsonKey() final  bool isPro;
@override final  SessionEffect? effect;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStateCopyWith<_SessionState> get copyWith => __$SessionStateCopyWithImpl<_SessionState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionState&&(identical(other.session, session) || other.session == session)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.inputMode, inputMode) || other.inputMode == inputMode)&&(identical(other.recording, recording) || other.recording == recording)&&(identical(other.mic, mic) || other.mic == mic)&&(identical(other.committedTranscript, committedTranscript) || other.committedTranscript == committedTranscript)&&(identical(other.partialTranscript, partialTranscript) || other.partialTranscript == partialTranscript)&&(identical(other.typedAnswer, typedAnswer) || other.typedAnswer == typedAnswer)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&(identical(other.isPro, isPro) || other.isPro == isPro)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session,currentIndex,phase,inputMode,recording,mic,committedTranscript,partialTranscript,typedAnswer,elapsedSeconds,isPro,effect);
}

@override
String toString() {
    return 'SessionState(session: $session, currentIndex: $currentIndex, phase: $phase, inputMode: $inputMode, recording: $recording, mic: $mic, committedTranscript: $committedTranscript, partialTranscript: $partialTranscript, typedAnswer: $typedAnswer, elapsedSeconds: $elapsedSeconds, isPro: $isPro, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$SessionStateCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$SessionStateCopyWith(_SessionState value, $Res Function(_SessionState) _then) = __$SessionStateCopyWithImpl;
@override @useResult
$Res call({
 InterviewSession? session, int currentIndex, SessionPhase phase, AnswerInputMode inputMode, RecordingState recording, MicAvailability mic, String committedTranscript, String partialTranscript, String typedAnswer, int elapsedSeconds, bool isPro, SessionEffect? effect
});


@override $InterviewSessionCopyWith<$Res>? get session;@override $SessionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$SessionStateCopyWithImpl<$Res>
    implements _$SessionStateCopyWith<$Res> {
  __$SessionStateCopyWithImpl(this._self, this._then);

  final _SessionState _self;
  final $Res Function(_SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? currentIndex = null,Object? phase = null,Object? inputMode = null,Object? recording = null,Object? mic = null,Object? committedTranscript = null,Object? partialTranscript = null,Object? typedAnswer = null,Object? elapsedSeconds = null,Object? isPro = null,Object? effect = freezed,}) {
  return _then(_SessionState(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as InterviewSession?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as SessionPhase,inputMode: null == inputMode ? _self.inputMode : inputMode // ignore: cast_nullable_to_non_nullable
as AnswerInputMode,recording: null == recording ? _self.recording : recording // ignore: cast_nullable_to_non_nullable
as RecordingState,mic: null == mic ? _self.mic : mic // ignore: cast_nullable_to_non_nullable
as MicAvailability,committedTranscript: null == committedTranscript ? _self.committedTranscript : committedTranscript // ignore: cast_nullable_to_non_nullable
as String,partialTranscript: null == partialTranscript ? _self.partialTranscript : partialTranscript // ignore: cast_nullable_to_non_nullable
as String,typedAnswer: null == typedAnswer ? _self.typedAnswer : typedAnswer // ignore: cast_nullable_to_non_nullable
as String,elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,isPro: null == isPro ? _self.isPro : isPro // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as SessionEffect?,
  ));
}

/// Create a copy of SessionState
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
}/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $SessionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
