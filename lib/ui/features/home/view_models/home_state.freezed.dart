// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEffect {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEffect()';
}


}

/// @nodoc
class $HomeEffectCopyWith<$Res>  {
$HomeEffectCopyWith(HomeEffect _, $Res Function(HomeEffect) __);
}


/// Adds pattern-matching-related methods to [HomeEffect].
extension HomeEffectPatterns on HomeEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeEffectOpenSession value)?  openSession,TResult Function( HomeEffectOpenPaywall value)?  openPaywall,TResult Function( HomeEffectPostingRequired value)?  postingRequired,TResult Function( HomeEffectShowError value)?  showError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeEffectOpenSession() when openSession != null:
return openSession(_that);case HomeEffectOpenPaywall() when openPaywall != null:
return openPaywall(_that);case HomeEffectPostingRequired() when postingRequired != null:
return postingRequired(_that);case HomeEffectShowError() when showError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeEffectOpenSession value)  openSession,required TResult Function( HomeEffectOpenPaywall value)  openPaywall,required TResult Function( HomeEffectPostingRequired value)  postingRequired,required TResult Function( HomeEffectShowError value)  showError,}){
final _that = this;
switch (_that) {
case HomeEffectOpenSession():
return openSession(_that);case HomeEffectOpenPaywall():
return openPaywall(_that);case HomeEffectPostingRequired():
return postingRequired(_that);case HomeEffectShowError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeEffectOpenSession value)?  openSession,TResult? Function( HomeEffectOpenPaywall value)?  openPaywall,TResult? Function( HomeEffectPostingRequired value)?  postingRequired,TResult? Function( HomeEffectShowError value)?  showError,}){
final _that = this;
switch (_that) {
case HomeEffectOpenSession() when openSession != null:
return openSession(_that);case HomeEffectOpenPaywall() when openPaywall != null:
return openPaywall(_that);case HomeEffectPostingRequired() when postingRequired != null:
return postingRequired(_that);case HomeEffectShowError() when showError != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String sessionId)?  openSession,TResult Function()?  openPaywall,TResult Function()?  postingRequired,TResult Function( AppException error)?  showError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeEffectOpenSession() when openSession != null:
return openSession(_that.sessionId);case HomeEffectOpenPaywall() when openPaywall != null:
return openPaywall();case HomeEffectPostingRequired() when postingRequired != null:
return postingRequired();case HomeEffectShowError() when showError != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String sessionId)  openSession,required TResult Function()  openPaywall,required TResult Function()  postingRequired,required TResult Function( AppException error)  showError,}) {final _that = this;
switch (_that) {
case HomeEffectOpenSession():
return openSession(_that.sessionId);case HomeEffectOpenPaywall():
return openPaywall();case HomeEffectPostingRequired():
return postingRequired();case HomeEffectShowError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String sessionId)?  openSession,TResult? Function()?  openPaywall,TResult? Function()?  postingRequired,TResult? Function( AppException error)?  showError,}) {final _that = this;
switch (_that) {
case HomeEffectOpenSession() when openSession != null:
return openSession(_that.sessionId);case HomeEffectOpenPaywall() when openPaywall != null:
return openPaywall();case HomeEffectPostingRequired() when postingRequired != null:
return postingRequired();case HomeEffectShowError() when showError != null:
return showError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class HomeEffectOpenSession implements HomeEffect {
  const HomeEffectOpenSession(this.sessionId);
  

 final  String sessionId;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEffectOpenSessionCopyWith<HomeEffectOpenSession> get copyWith => _$HomeEffectOpenSessionCopyWithImpl<HomeEffectOpenSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEffectOpenSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sessionId);
}

@override
String toString() {
    return 'HomeEffect.openSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $HomeEffectOpenSessionCopyWith<$Res> implements $HomeEffectCopyWith<$Res> {
  factory $HomeEffectOpenSessionCopyWith(HomeEffectOpenSession value, $Res Function(HomeEffectOpenSession) _then) = _$HomeEffectOpenSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$HomeEffectOpenSessionCopyWithImpl<$Res>
    implements $HomeEffectOpenSessionCopyWith<$Res> {
  _$HomeEffectOpenSessionCopyWithImpl(this._self, this._then);

  final HomeEffectOpenSession _self;
  final $Res Function(HomeEffectOpenSession) _then;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(HomeEffectOpenSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeEffectOpenPaywall implements HomeEffect {
  const HomeEffectOpenPaywall();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEffectOpenPaywall);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEffect.openPaywall()';
}


}




/// @nodoc


class HomeEffectPostingRequired implements HomeEffect {
  const HomeEffectPostingRequired();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEffectPostingRequired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEffect.postingRequired()';
}


}




/// @nodoc


class HomeEffectShowError implements HomeEffect {
  const HomeEffectShowError(this.error);
  

 final  AppException error;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEffectShowErrorCopyWith<HomeEffectShowError> get copyWith => _$HomeEffectShowErrorCopyWithImpl<HomeEffectShowError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEffectShowError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeEffect.showError(error: $error)';
}


}

/// @nodoc
abstract mixin class $HomeEffectShowErrorCopyWith<$Res> implements $HomeEffectCopyWith<$Res> {
  factory $HomeEffectShowErrorCopyWith(HomeEffectShowError value, $Res Function(HomeEffectShowError) _then) = _$HomeEffectShowErrorCopyWithImpl;
@useResult
$Res call({
 AppException error
});




}
/// @nodoc
class _$HomeEffectShowErrorCopyWithImpl<$Res>
    implements $HomeEffectShowErrorCopyWith<$Res> {
  _$HomeEffectShowErrorCopyWithImpl(this._self, this._then);

  final HomeEffectShowError _self;
  final $Res Function(HomeEffectShowError) _then;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(HomeEffectShowError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 UserProfile get profile; InterviewLanguage get language; int get questionCount; String get jobPosting; bool get isPro; int get startedSessions; List<InterviewSession> get recentSessions; bool get isGenerating; HomeEffect? get effect;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.questionCount, _this.questionCount) || other.questionCount == _this.questionCount)&&(identical(other.jobPosting, _this.jobPosting) || other.jobPosting == _this.jobPosting)&&(identical(other.isPro, _this.isPro) || other.isPro == _this.isPro)&&(identical(other.startedSessions, _this.startedSessions) || other.startedSessions == _this.startedSessions)&&const DeepCollectionEquality().equals(other.recentSessions, _this.recentSessions)&&(identical(other.isGenerating, _this.isGenerating) || other.isGenerating == _this.isGenerating)&&(identical(other.effect, _this.effect) || other.effect == _this.effect));
}


@override
int get hashCode {
  final _this = this as HomeState;
  return Object.hash(runtimeType,_this.profile,_this.language,_this.questionCount,_this.jobPosting,_this.isPro,_this.startedSessions,const DeepCollectionEquality().hash(_this.recentSessions),_this.isGenerating,_this.effect);
}

@override
String toString() {
  final _this = this as HomeState;
  return 'HomeState(profile: ${_this.profile}, language: ${_this.language}, questionCount: ${_this.questionCount}, jobPosting: ${_this.jobPosting}, isPro: ${_this.isPro}, startedSessions: ${_this.startedSessions}, recentSessions: ${_this.recentSessions}, isGenerating: ${_this.isGenerating}, effect: ${_this.effect})';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 UserProfile profile, InterviewLanguage language, int questionCount, String jobPosting, bool isPro, int startedSessions, List<InterviewSession> recentSessions, bool isGenerating, HomeEffect? effect
});


$UserProfileCopyWith<$Res> get profile;$HomeEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? language = null,Object? questionCount = null,Object? jobPosting = null,Object? isPro = null,Object? startedSessions = null,Object? recentSessions = null,Object? isGenerating = null,Object? effect = freezed,}) {
  return _then(HomeState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as InterviewLanguage,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,jobPosting: null == jobPosting ? _self.jobPosting : jobPosting // ignore: cast_nullable_to_non_nullable
as String,isPro: null == isPro ? _self.isPro : isPro // ignore: cast_nullable_to_non_nullable
as bool,startedSessions: null == startedSessions ? _self.startedSessions : startedSessions // ignore: cast_nullable_to_non_nullable
as int,recentSessions: null == recentSessions ? _self.recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<InterviewSession>,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as HomeEffect?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get profile {
  
  return $UserProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $HomeEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfile profile,  InterviewLanguage language,  int questionCount,  String jobPosting,  bool isPro,  int startedSessions,  List<InterviewSession> recentSessions,  bool isGenerating,  HomeEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.profile,_that.language,_that.questionCount,_that.jobPosting,_that.isPro,_that.startedSessions,_that.recentSessions,_that.isGenerating,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfile profile,  InterviewLanguage language,  int questionCount,  String jobPosting,  bool isPro,  int startedSessions,  List<InterviewSession> recentSessions,  bool isGenerating,  HomeEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.profile,_that.language,_that.questionCount,_that.jobPosting,_that.isPro,_that.startedSessions,_that.recentSessions,_that.isGenerating,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfile profile,  InterviewLanguage language,  int questionCount,  String jobPosting,  bool isPro,  int startedSessions,  List<InterviewSession> recentSessions,  bool isGenerating,  HomeEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.profile,_that.language,_that.questionCount,_that.jobPosting,_that.isPro,_that.startedSessions,_that.recentSessions,_that.isGenerating,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({required this.profile, required this.language, required this.questionCount, this.jobPosting = '', this.isPro = false, this.startedSessions = 0,  List<InterviewSession> recentSessions = const [], this.isGenerating = false, this.effect}): _recentSessions = recentSessions,super._();
  

@override final  UserProfile profile;
@override final  InterviewLanguage language;
@override final  int questionCount;
@override@JsonKey() final  String jobPosting;
@override@JsonKey() final  bool isPro;
@override@JsonKey() final  int startedSessions;
 final  List<InterviewSession> _recentSessions;
@override@JsonKey() List<InterviewSession> get recentSessions {
  if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSessions);
}

@override@JsonKey() final  bool isGenerating;
@override final  HomeEffect? effect;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.language, language) || other.language == language)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.jobPosting, jobPosting) || other.jobPosting == jobPosting)&&(identical(other.isPro, isPro) || other.isPro == isPro)&&(identical(other.startedSessions, startedSessions) || other.startedSessions == startedSessions)&&const DeepCollectionEquality().equals(other.recentSessions, _recentSessions)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,profile,language,questionCount,jobPosting,isPro,startedSessions,const DeepCollectionEquality().hash(_recentSessions),isGenerating,effect);
}

@override
String toString() {
    return 'HomeState(profile: $profile, language: $language, questionCount: $questionCount, jobPosting: $jobPosting, isPro: $isPro, startedSessions: $startedSessions, recentSessions: $recentSessions, isGenerating: $isGenerating, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 UserProfile profile, InterviewLanguage language, int questionCount, String jobPosting, bool isPro, int startedSessions, List<InterviewSession> recentSessions, bool isGenerating, HomeEffect? effect
});


@override $UserProfileCopyWith<$Res> get profile;@override $HomeEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? language = null,Object? questionCount = null,Object? jobPosting = null,Object? isPro = null,Object? startedSessions = null,Object? recentSessions = null,Object? isGenerating = null,Object? effect = freezed,}) {
  return _then(_HomeState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as InterviewLanguage,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,jobPosting: null == jobPosting ? _self.jobPosting : jobPosting // ignore: cast_nullable_to_non_nullable
as String,isPro: null == isPro ? _self.isPro : isPro // ignore: cast_nullable_to_non_nullable
as bool,startedSessions: null == startedSessions ? _self.startedSessions : startedSessions // ignore: cast_nullable_to_non_nullable
as int,recentSessions: null == recentSessions ? _self._recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<InterviewSession>,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as HomeEffect?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get profile {
  
  return $UserProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $HomeEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
