// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionPlan {

 String get id; PlanPeriod get period; double get price; String get currencyCode; int get trialDays;
/// Create a copy of SubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionPlanCopyWith<SubscriptionPlan> get copyWith => _$SubscriptionPlanCopyWithImpl<SubscriptionPlan>(this as SubscriptionPlan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SubscriptionPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionPlan&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.currencyCode, _this.currencyCode) || other.currencyCode == _this.currencyCode)&&(identical(other.trialDays, _this.trialDays) || other.trialDays == _this.trialDays));
}


@override
int get hashCode {
  final _this = this as SubscriptionPlan;
  return Object.hash(runtimeType,_this.id,_this.period,_this.price,_this.currencyCode,_this.trialDays);
}

@override
String toString() {
  final _this = this as SubscriptionPlan;
  return 'SubscriptionPlan(id: ${_this.id}, period: ${_this.period}, price: ${_this.price}, currencyCode: ${_this.currencyCode}, trialDays: ${_this.trialDays})';
}


}

/// @nodoc
abstract mixin class $SubscriptionPlanCopyWith<$Res>  {
  factory $SubscriptionPlanCopyWith(SubscriptionPlan value, $Res Function(SubscriptionPlan) _then) = _$SubscriptionPlanCopyWithImpl;
@useResult
$Res call({
 String id, PlanPeriod period, double price, String currencyCode, int trialDays
});




}
/// @nodoc
class _$SubscriptionPlanCopyWithImpl<$Res>
    implements $SubscriptionPlanCopyWith<$Res> {
  _$SubscriptionPlanCopyWithImpl(this._self, this._then);

  final SubscriptionPlan _self;
  final $Res Function(SubscriptionPlan) _then;

/// Create a copy of SubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? period = null,Object? price = null,Object? currencyCode = null,Object? trialDays = null,}) {
  return _then(SubscriptionPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PlanPeriod,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,trialDays: null == trialDays ? _self.trialDays : trialDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionPlan].
extension SubscriptionPlanPatterns on SubscriptionPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionPlan value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionPlan value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PlanPeriod period,  double price,  String currencyCode,  int trialDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionPlan() when $default != null:
return $default(_that.id,_that.period,_that.price,_that.currencyCode,_that.trialDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PlanPeriod period,  double price,  String currencyCode,  int trialDays)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionPlan():
return $default(_that.id,_that.period,_that.price,_that.currencyCode,_that.trialDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PlanPeriod period,  double price,  String currencyCode,  int trialDays)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionPlan() when $default != null:
return $default(_that.id,_that.period,_that.price,_that.currencyCode,_that.trialDays);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionPlan extends SubscriptionPlan {
  const _SubscriptionPlan({required this.id, required this.period, required this.price, required this.currencyCode, this.trialDays = 0}): super._();
  

@override final  String id;
@override final  PlanPeriod period;
@override final  double price;
@override final  String currencyCode;
@override@JsonKey() final  int trialDays;

/// Create a copy of SubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionPlanCopyWith<_SubscriptionPlan> get copyWith => __$SubscriptionPlanCopyWithImpl<_SubscriptionPlan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.period, period) || other.period == period)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.trialDays, trialDays) || other.trialDays == trialDays));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,period,price,currencyCode,trialDays);
}

@override
String toString() {
    return 'SubscriptionPlan(id: $id, period: $period, price: $price, currencyCode: $currencyCode, trialDays: $trialDays)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionPlanCopyWith<$Res> implements $SubscriptionPlanCopyWith<$Res> {
  factory _$SubscriptionPlanCopyWith(_SubscriptionPlan value, $Res Function(_SubscriptionPlan) _then) = __$SubscriptionPlanCopyWithImpl;
@override @useResult
$Res call({
 String id, PlanPeriod period, double price, String currencyCode, int trialDays
});




}
/// @nodoc
class __$SubscriptionPlanCopyWithImpl<$Res>
    implements _$SubscriptionPlanCopyWith<$Res> {
  __$SubscriptionPlanCopyWithImpl(this._self, this._then);

  final _SubscriptionPlan _self;
  final $Res Function(_SubscriptionPlan) _then;

/// Create a copy of SubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? period = null,Object? price = null,Object? currencyCode = null,Object? trialDays = null,}) {
  return _then(_SubscriptionPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PlanPeriod,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,trialDays: null == trialDays ? _self.trialDays : trialDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SubscriptionStatus {

 bool get isPro; PlanPeriod? get period; DateTime? get renewsAt; bool get isInTrial;
/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionStatusCopyWith<SubscriptionStatus> get copyWith => _$SubscriptionStatusCopyWithImpl<SubscriptionStatus>(this as SubscriptionStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SubscriptionStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionStatus&&(identical(other.isPro, _this.isPro) || other.isPro == _this.isPro)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.renewsAt, _this.renewsAt) || other.renewsAt == _this.renewsAt)&&(identical(other.isInTrial, _this.isInTrial) || other.isInTrial == _this.isInTrial));
}


@override
int get hashCode {
  final _this = this as SubscriptionStatus;
  return Object.hash(runtimeType,_this.isPro,_this.period,_this.renewsAt,_this.isInTrial);
}

@override
String toString() {
  final _this = this as SubscriptionStatus;
  return 'SubscriptionStatus(isPro: ${_this.isPro}, period: ${_this.period}, renewsAt: ${_this.renewsAt}, isInTrial: ${_this.isInTrial})';
}


}

/// @nodoc
abstract mixin class $SubscriptionStatusCopyWith<$Res>  {
  factory $SubscriptionStatusCopyWith(SubscriptionStatus value, $Res Function(SubscriptionStatus) _then) = _$SubscriptionStatusCopyWithImpl;
@useResult
$Res call({
 bool isPro, PlanPeriod? period, DateTime? renewsAt, bool isInTrial
});




}
/// @nodoc
class _$SubscriptionStatusCopyWithImpl<$Res>
    implements $SubscriptionStatusCopyWith<$Res> {
  _$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final SubscriptionStatus _self;
  final $Res Function(SubscriptionStatus) _then;

/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPro = null,Object? period = freezed,Object? renewsAt = freezed,Object? isInTrial = null,}) {
  return _then(SubscriptionStatus(
isPro: null == isPro ? _self.isPro : isPro // ignore: cast_nullable_to_non_nullable
as bool,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PlanPeriod?,renewsAt: freezed == renewsAt ? _self.renewsAt : renewsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isInTrial: null == isInTrial ? _self.isInTrial : isInTrial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionStatus].
extension SubscriptionStatusPatterns on SubscriptionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionStatus value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPro,  PlanPeriod? period,  DateTime? renewsAt,  bool isInTrial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
return $default(_that.isPro,_that.period,_that.renewsAt,_that.isInTrial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPro,  PlanPeriod? period,  DateTime? renewsAt,  bool isInTrial)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionStatus():
return $default(_that.isPro,_that.period,_that.renewsAt,_that.isInTrial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPro,  PlanPeriod? period,  DateTime? renewsAt,  bool isInTrial)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
return $default(_that.isPro,_that.period,_that.renewsAt,_that.isInTrial);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionStatus implements SubscriptionStatus {
  const _SubscriptionStatus({this.isPro = false, this.period, this.renewsAt, this.isInTrial = false});
  

@override@JsonKey() final  bool isPro;
@override final  PlanPeriod? period;
@override final  DateTime? renewsAt;
@override@JsonKey() final  bool isInTrial;

/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionStatusCopyWith<_SubscriptionStatus> get copyWith => __$SubscriptionStatusCopyWithImpl<_SubscriptionStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionStatus&&(identical(other.isPro, isPro) || other.isPro == isPro)&&(identical(other.period, period) || other.period == period)&&(identical(other.renewsAt, renewsAt) || other.renewsAt == renewsAt)&&(identical(other.isInTrial, isInTrial) || other.isInTrial == isInTrial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isPro,period,renewsAt,isInTrial);
}

@override
String toString() {
    return 'SubscriptionStatus(isPro: $isPro, period: $period, renewsAt: $renewsAt, isInTrial: $isInTrial)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionStatusCopyWith<$Res> implements $SubscriptionStatusCopyWith<$Res> {
  factory _$SubscriptionStatusCopyWith(_SubscriptionStatus value, $Res Function(_SubscriptionStatus) _then) = __$SubscriptionStatusCopyWithImpl;
@override @useResult
$Res call({
 bool isPro, PlanPeriod? period, DateTime? renewsAt, bool isInTrial
});




}
/// @nodoc
class __$SubscriptionStatusCopyWithImpl<$Res>
    implements _$SubscriptionStatusCopyWith<$Res> {
  __$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final _SubscriptionStatus _self;
  final $Res Function(_SubscriptionStatus) _then;

/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPro = null,Object? period = freezed,Object? renewsAt = freezed,Object? isInTrial = null,}) {
  return _then(_SubscriptionStatus(
isPro: null == isPro ? _self.isPro : isPro // ignore: cast_nullable_to_non_nullable
as bool,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PlanPeriod?,renewsAt: freezed == renewsAt ? _self.renewsAt : renewsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isInTrial: null == isInTrial ? _self.isInTrial : isInTrial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
