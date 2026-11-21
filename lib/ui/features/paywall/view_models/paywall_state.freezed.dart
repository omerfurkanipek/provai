// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paywall_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaywallEffect {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PaywallEffect()';
}


}

/// @nodoc
class $PaywallEffectCopyWith<$Res>  {
$PaywallEffectCopyWith(PaywallEffect _, $Res Function(PaywallEffect) __);
}


/// Adds pattern-matching-related methods to [PaywallEffect].
extension PaywallEffectPatterns on PaywallEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaywallEffectUnlocked value)?  unlocked,TResult Function( PaywallEffectDismissed value)?  dismissed,TResult Function( PaywallEffectNothingToRestore value)?  nothingToRestore,TResult Function( PaywallEffectFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaywallEffectUnlocked() when unlocked != null:
return unlocked(_that);case PaywallEffectDismissed() when dismissed != null:
return dismissed(_that);case PaywallEffectNothingToRestore() when nothingToRestore != null:
return nothingToRestore(_that);case PaywallEffectFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaywallEffectUnlocked value)  unlocked,required TResult Function( PaywallEffectDismissed value)  dismissed,required TResult Function( PaywallEffectNothingToRestore value)  nothingToRestore,required TResult Function( PaywallEffectFailed value)  failed,}){
final _that = this;
switch (_that) {
case PaywallEffectUnlocked():
return unlocked(_that);case PaywallEffectDismissed():
return dismissed(_that);case PaywallEffectNothingToRestore():
return nothingToRestore(_that);case PaywallEffectFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaywallEffectUnlocked value)?  unlocked,TResult? Function( PaywallEffectDismissed value)?  dismissed,TResult? Function( PaywallEffectNothingToRestore value)?  nothingToRestore,TResult? Function( PaywallEffectFailed value)?  failed,}){
final _that = this;
switch (_that) {
case PaywallEffectUnlocked() when unlocked != null:
return unlocked(_that);case PaywallEffectDismissed() when dismissed != null:
return dismissed(_that);case PaywallEffectNothingToRestore() when nothingToRestore != null:
return nothingToRestore(_that);case PaywallEffectFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unlocked,TResult Function()?  dismissed,TResult Function()?  nothingToRestore,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaywallEffectUnlocked() when unlocked != null:
return unlocked();case PaywallEffectDismissed() when dismissed != null:
return dismissed();case PaywallEffectNothingToRestore() when nothingToRestore != null:
return nothingToRestore();case PaywallEffectFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unlocked,required TResult Function()  dismissed,required TResult Function()  nothingToRestore,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case PaywallEffectUnlocked():
return unlocked();case PaywallEffectDismissed():
return dismissed();case PaywallEffectNothingToRestore():
return nothingToRestore();case PaywallEffectFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unlocked,TResult? Function()?  dismissed,TResult? Function()?  nothingToRestore,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case PaywallEffectUnlocked() when unlocked != null:
return unlocked();case PaywallEffectDismissed() when dismissed != null:
return dismissed();case PaywallEffectNothingToRestore() when nothingToRestore != null:
return nothingToRestore();case PaywallEffectFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class PaywallEffectUnlocked implements PaywallEffect {
  const PaywallEffectUnlocked();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEffectUnlocked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PaywallEffect.unlocked()';
}


}




/// @nodoc


class PaywallEffectDismissed implements PaywallEffect {
  const PaywallEffectDismissed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEffectDismissed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PaywallEffect.dismissed()';
}


}




/// @nodoc


class PaywallEffectNothingToRestore implements PaywallEffect {
  const PaywallEffectNothingToRestore();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEffectNothingToRestore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PaywallEffect.nothingToRestore()';
}


}




/// @nodoc


class PaywallEffectFailed implements PaywallEffect {
  const PaywallEffectFailed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEffectFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PaywallEffect.failed()';
}


}




/// @nodoc
mixin _$PaywallState {

 PaywallPlacement get placement; List<SubscriptionPlan> get plans; String? get selectedPlanId; UserProfile? get profile; bool get isPurchasing; bool get isRestoring; PaywallEffect? get effect;
/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaywallStateCopyWith<PaywallState> get copyWith => _$PaywallStateCopyWithImpl<PaywallState>(this as PaywallState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaywallState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallState&&(identical(other.placement, _this.placement) || other.placement == _this.placement)&&const DeepCollectionEquality().equals(other.plans, _this.plans)&&(identical(other.selectedPlanId, _this.selectedPlanId) || other.selectedPlanId == _this.selectedPlanId)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.isPurchasing, _this.isPurchasing) || other.isPurchasing == _this.isPurchasing)&&(identical(other.isRestoring, _this.isRestoring) || other.isRestoring == _this.isRestoring)&&(identical(other.effect, _this.effect) || other.effect == _this.effect));
}


@override
int get hashCode {
  final _this = this as PaywallState;
  return Object.hash(runtimeType,_this.placement,const DeepCollectionEquality().hash(_this.plans),_this.selectedPlanId,_this.profile,_this.isPurchasing,_this.isRestoring,_this.effect);
}

@override
String toString() {
  final _this = this as PaywallState;
  return 'PaywallState(placement: ${_this.placement}, plans: ${_this.plans}, selectedPlanId: ${_this.selectedPlanId}, profile: ${_this.profile}, isPurchasing: ${_this.isPurchasing}, isRestoring: ${_this.isRestoring}, effect: ${_this.effect})';
}


}

/// @nodoc
abstract mixin class $PaywallStateCopyWith<$Res>  {
  factory $PaywallStateCopyWith(PaywallState value, $Res Function(PaywallState) _then) = _$PaywallStateCopyWithImpl;
@useResult
$Res call({
 PaywallPlacement placement, List<SubscriptionPlan> plans, String? selectedPlanId, UserProfile? profile, bool isPurchasing, bool isRestoring, PaywallEffect? effect
});


$UserProfileCopyWith<$Res>? get profile;$PaywallEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$PaywallStateCopyWithImpl<$Res>
    implements $PaywallStateCopyWith<$Res> {
  _$PaywallStateCopyWithImpl(this._self, this._then);

  final PaywallState _self;
  final $Res Function(PaywallState) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placement = null,Object? plans = null,Object? selectedPlanId = freezed,Object? profile = freezed,Object? isPurchasing = null,Object? isRestoring = null,Object? effect = freezed,}) {
  return _then(PaywallState(
placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as PaywallPlacement,plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPlan>,selectedPlanId: freezed == selectedPlanId ? _self.selectedPlanId : selectedPlanId // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,isPurchasing: null == isPurchasing ? _self.isPurchasing : isPurchasing // ignore: cast_nullable_to_non_nullable
as bool,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as PaywallEffect?,
  ));
}
/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaywallEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $PaywallEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaywallState].
extension PaywallStatePatterns on PaywallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaywallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaywallState value)  $default,){
final _that = this;
switch (_that) {
case _PaywallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaywallState value)?  $default,){
final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaywallPlacement placement,  List<SubscriptionPlan> plans,  String? selectedPlanId,  UserProfile? profile,  bool isPurchasing,  bool isRestoring,  PaywallEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
return $default(_that.placement,_that.plans,_that.selectedPlanId,_that.profile,_that.isPurchasing,_that.isRestoring,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaywallPlacement placement,  List<SubscriptionPlan> plans,  String? selectedPlanId,  UserProfile? profile,  bool isPurchasing,  bool isRestoring,  PaywallEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _PaywallState():
return $default(_that.placement,_that.plans,_that.selectedPlanId,_that.profile,_that.isPurchasing,_that.isRestoring,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaywallPlacement placement,  List<SubscriptionPlan> plans,  String? selectedPlanId,  UserProfile? profile,  bool isPurchasing,  bool isRestoring,  PaywallEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
return $default(_that.placement,_that.plans,_that.selectedPlanId,_that.profile,_that.isPurchasing,_that.isRestoring,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _PaywallState extends PaywallState {
  const _PaywallState({required this.placement,  List<SubscriptionPlan> plans = const [], this.selectedPlanId, this.profile, this.isPurchasing = false, this.isRestoring = false, this.effect}): _plans = plans,super._();
  

@override final  PaywallPlacement placement;
 final  List<SubscriptionPlan> _plans;
@override@JsonKey() List<SubscriptionPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override final  String? selectedPlanId;
@override final  UserProfile? profile;
@override@JsonKey() final  bool isPurchasing;
@override@JsonKey() final  bool isRestoring;
@override final  PaywallEffect? effect;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaywallStateCopyWith<_PaywallState> get copyWith => __$PaywallStateCopyWithImpl<_PaywallState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaywallState&&(identical(other.placement, placement) || other.placement == placement)&&const DeepCollectionEquality().equals(other.plans, _plans)&&(identical(other.selectedPlanId, selectedPlanId) || other.selectedPlanId == selectedPlanId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isPurchasing, isPurchasing) || other.isPurchasing == isPurchasing)&&(identical(other.isRestoring, isRestoring) || other.isRestoring == isRestoring)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,placement,const DeepCollectionEquality().hash(_plans),selectedPlanId,profile,isPurchasing,isRestoring,effect);
}

@override
String toString() {
    return 'PaywallState(placement: $placement, plans: $plans, selectedPlanId: $selectedPlanId, profile: $profile, isPurchasing: $isPurchasing, isRestoring: $isRestoring, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$PaywallStateCopyWith<$Res> implements $PaywallStateCopyWith<$Res> {
  factory _$PaywallStateCopyWith(_PaywallState value, $Res Function(_PaywallState) _then) = __$PaywallStateCopyWithImpl;
@override @useResult
$Res call({
 PaywallPlacement placement, List<SubscriptionPlan> plans, String? selectedPlanId, UserProfile? profile, bool isPurchasing, bool isRestoring, PaywallEffect? effect
});


@override $UserProfileCopyWith<$Res>? get profile;@override $PaywallEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$PaywallStateCopyWithImpl<$Res>
    implements _$PaywallStateCopyWith<$Res> {
  __$PaywallStateCopyWithImpl(this._self, this._then);

  final _PaywallState _self;
  final $Res Function(_PaywallState) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placement = null,Object? plans = null,Object? selectedPlanId = freezed,Object? profile = freezed,Object? isPurchasing = null,Object? isRestoring = null,Object? effect = freezed,}) {
  return _then(_PaywallState(
placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as PaywallPlacement,plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPlan>,selectedPlanId: freezed == selectedPlanId ? _self.selectedPlanId : selectedPlanId // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,isPurchasing: null == isPurchasing ? _self.isPurchasing : isPurchasing // ignore: cast_nullable_to_non_nullable
as bool,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as PaywallEffect?,
  ));
}

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaywallEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $PaywallEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
