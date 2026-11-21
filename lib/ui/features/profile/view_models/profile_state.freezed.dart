// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEffect {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEffect()';
}


}

/// @nodoc
class $ProfileEffectCopyWith<$Res>  {
$ProfileEffectCopyWith(ProfileEffect _, $Res Function(ProfileEffect) __);
}


/// Adds pattern-matching-related methods to [ProfileEffect].
extension ProfileEffectPatterns on ProfileEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileEffectRestored value)?  restored,TResult Function( ProfileEffectUpdated value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileEffectRestored() when restored != null:
return restored(_that);case ProfileEffectUpdated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileEffectRestored value)  restored,required TResult Function( ProfileEffectUpdated value)  updated,}){
final _that = this;
switch (_that) {
case ProfileEffectRestored():
return restored(_that);case ProfileEffectUpdated():
return updated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileEffectRestored value)?  restored,TResult? Function( ProfileEffectUpdated value)?  updated,}){
final _that = this;
switch (_that) {
case ProfileEffectRestored() when restored != null:
return restored(_that);case ProfileEffectUpdated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool found)?  restored,TResult Function()?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileEffectRestored() when restored != null:
return restored(_that.found);case ProfileEffectUpdated() when updated != null:
return updated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool found)  restored,required TResult Function()  updated,}) {final _that = this;
switch (_that) {
case ProfileEffectRestored():
return restored(_that.found);case ProfileEffectUpdated():
return updated();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool found)?  restored,TResult? Function()?  updated,}) {final _that = this;
switch (_that) {
case ProfileEffectRestored() when restored != null:
return restored(_that.found);case ProfileEffectUpdated() when updated != null:
return updated();case _:
  return null;

}
}

}

/// @nodoc


class ProfileEffectRestored implements ProfileEffect {
  const ProfileEffectRestored({required this.found});
  

 final  bool found;

/// Create a copy of ProfileEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEffectRestoredCopyWith<ProfileEffectRestored> get copyWith => _$ProfileEffectRestoredCopyWithImpl<ProfileEffectRestored>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEffectRestored&&(identical(other.found, found) || other.found == found));
}


@override
int get hashCode {
    return Object.hash(runtimeType,found);
}

@override
String toString() {
    return 'ProfileEffect.restored(found: $found)';
}


}

/// @nodoc
abstract mixin class $ProfileEffectRestoredCopyWith<$Res> implements $ProfileEffectCopyWith<$Res> {
  factory $ProfileEffectRestoredCopyWith(ProfileEffectRestored value, $Res Function(ProfileEffectRestored) _then) = _$ProfileEffectRestoredCopyWithImpl;
@useResult
$Res call({
 bool found
});




}
/// @nodoc
class _$ProfileEffectRestoredCopyWithImpl<$Res>
    implements $ProfileEffectRestoredCopyWith<$Res> {
  _$ProfileEffectRestoredCopyWithImpl(this._self, this._then);

  final ProfileEffectRestored _self;
  final $Res Function(ProfileEffectRestored) _then;

/// Create a copy of ProfileEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? found = null,}) {
  return _then(ProfileEffectRestored(
found: null == found ? _self.found : found // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProfileEffectUpdated implements ProfileEffect {
  const ProfileEffectUpdated();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEffectUpdated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEffect.updated()';
}


}




/// @nodoc
mixin _$ProfileState {

 UserProfile get profile; SubscriptionStatus get subscription; int get startedSessions; int get completedSessions; int? get averageScore; String get version; bool get isRestoring; ProfileEffect? get effect;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfileState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.subscription, _this.subscription) || other.subscription == _this.subscription)&&(identical(other.startedSessions, _this.startedSessions) || other.startedSessions == _this.startedSessions)&&(identical(other.completedSessions, _this.completedSessions) || other.completedSessions == _this.completedSessions)&&(identical(other.averageScore, _this.averageScore) || other.averageScore == _this.averageScore)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.isRestoring, _this.isRestoring) || other.isRestoring == _this.isRestoring)&&(identical(other.effect, _this.effect) || other.effect == _this.effect));
}


@override
int get hashCode {
  final _this = this as ProfileState;
  return Object.hash(runtimeType,_this.profile,_this.subscription,_this.startedSessions,_this.completedSessions,_this.averageScore,_this.version,_this.isRestoring,_this.effect);
}

@override
String toString() {
  final _this = this as ProfileState;
  return 'ProfileState(profile: ${_this.profile}, subscription: ${_this.subscription}, startedSessions: ${_this.startedSessions}, completedSessions: ${_this.completedSessions}, averageScore: ${_this.averageScore}, version: ${_this.version}, isRestoring: ${_this.isRestoring}, effect: ${_this.effect})';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 UserProfile profile, SubscriptionStatus subscription, int startedSessions, int completedSessions, int? averageScore, String version, bool isRestoring, ProfileEffect? effect
});


$UserProfileCopyWith<$Res> get profile;$SubscriptionStatusCopyWith<$Res> get subscription;$ProfileEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? subscription = null,Object? startedSessions = null,Object? completedSessions = null,Object? averageScore = freezed,Object? version = null,Object? isRestoring = null,Object? effect = freezed,}) {
  return _then(ProfileState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile,subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,startedSessions: null == startedSessions ? _self.startedSessions : startedSessions // ignore: cast_nullable_to_non_nullable
as int,completedSessions: null == completedSessions ? _self.completedSessions : completedSessions // ignore: cast_nullable_to_non_nullable
as int,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ProfileEffect?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get profile {
  
  return $UserProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionStatusCopyWith<$Res> get subscription {
  
  return $SubscriptionStatusCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ProfileEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfile profile,  SubscriptionStatus subscription,  int startedSessions,  int completedSessions,  int? averageScore,  String version,  bool isRestoring,  ProfileEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.profile,_that.subscription,_that.startedSessions,_that.completedSessions,_that.averageScore,_that.version,_that.isRestoring,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfile profile,  SubscriptionStatus subscription,  int startedSessions,  int completedSessions,  int? averageScore,  String version,  bool isRestoring,  ProfileEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.profile,_that.subscription,_that.startedSessions,_that.completedSessions,_that.averageScore,_that.version,_that.isRestoring,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfile profile,  SubscriptionStatus subscription,  int startedSessions,  int completedSessions,  int? averageScore,  String version,  bool isRestoring,  ProfileEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.profile,_that.subscription,_that.startedSessions,_that.completedSessions,_that.averageScore,_that.version,_that.isRestoring,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState extends ProfileState {
  const _ProfileState({required this.profile, required this.subscription, required this.startedSessions, required this.completedSessions, this.averageScore, this.version = '', this.isRestoring = false, this.effect}): super._();
  

@override final  UserProfile profile;
@override final  SubscriptionStatus subscription;
@override final  int startedSessions;
@override final  int completedSessions;
@override final  int? averageScore;
@override@JsonKey() final  String version;
@override@JsonKey() final  bool isRestoring;
@override final  ProfileEffect? effect;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.subscription, subscription) || other.subscription == subscription)&&(identical(other.startedSessions, startedSessions) || other.startedSessions == startedSessions)&&(identical(other.completedSessions, completedSessions) || other.completedSessions == completedSessions)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.version, version) || other.version == version)&&(identical(other.isRestoring, isRestoring) || other.isRestoring == isRestoring)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,profile,subscription,startedSessions,completedSessions,averageScore,version,isRestoring,effect);
}

@override
String toString() {
    return 'ProfileState(profile: $profile, subscription: $subscription, startedSessions: $startedSessions, completedSessions: $completedSessions, averageScore: $averageScore, version: $version, isRestoring: $isRestoring, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserProfile profile, SubscriptionStatus subscription, int startedSessions, int completedSessions, int? averageScore, String version, bool isRestoring, ProfileEffect? effect
});


@override $UserProfileCopyWith<$Res> get profile;@override $SubscriptionStatusCopyWith<$Res> get subscription;@override $ProfileEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? subscription = null,Object? startedSessions = null,Object? completedSessions = null,Object? averageScore = freezed,Object? version = null,Object? isRestoring = null,Object? effect = freezed,}) {
  return _then(_ProfileState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile,subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,startedSessions: null == startedSessions ? _self.startedSessions : startedSessions // ignore: cast_nullable_to_non_nullable
as int,completedSessions: null == completedSessions ? _self.completedSessions : completedSessions // ignore: cast_nullable_to_non_nullable
as int,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ProfileEffect?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get profile {
  
  return $UserProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionStatusCopyWith<$Res> get subscription {
  
  return $SubscriptionStatusCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ProfileEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
