import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';

enum PlanPeriod { weekly, yearly }

/// Satın alınabilir bir plan. Fiyat görüntüleme formatı UI'da yapılır;
/// burada mağazadan gelecek ham değerlerin karşılığı tutulur.
@freezed
abstract class SubscriptionPlan with _$SubscriptionPlan {
  const factory SubscriptionPlan({
    required String id,
    required PlanPeriod period,
    required double price,
    required String currencyCode,
    @Default(0) int trialDays,
  }) = _SubscriptionPlan;

  const SubscriptionPlan._();

  /// Haftalık karşılık; yıllık planı haftalıkla kıyaslamak için.
  double get weeklyPrice => switch (period) {
    PlanPeriod.weekly => price,
    PlanPeriod.yearly => price / 52,
  };

  bool get hasTrial => trialDays > 0;
}

@freezed
abstract class SubscriptionStatus with _$SubscriptionStatus {
  const factory SubscriptionStatus({
    @Default(false) bool isPro,
    PlanPeriod? period,
    DateTime? renewsAt,
    @Default(false) bool isInTrial,
  }) = _SubscriptionStatus;
}
