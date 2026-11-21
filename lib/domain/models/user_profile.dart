import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

enum Seniority { intern, junior, mid, senior }

/// Mülakatın yapılacağı dil; AI soruları ve geri bildirimi bu dilde üretir.
enum InterviewLanguage { tr, en }

/// Kullanıcının en çok zorlandığı alan; AI geri bildiriminde önceliklendirilir.
enum Struggle { selfIntro, technical, behavioral, nerves }

/// Mülakat tarihi yakınlığı; paywall ve plan metinlerinde aciliyet için.
enum InterviewTiming { thisWeek, thisMonth, notScheduled }

/// Onboarding'de toplanan ve Profil'de düzenlenebilen kullanıcı bilgisi.
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    @Default('') String name,
    @Default('') String targetRole,
    @Default(Seniority.junior) Seniority seniority,
    @Default(InterviewLanguage.tr) InterviewLanguage interviewLanguage,
    @Default(Struggle.technical) Struggle struggle,
    @Default(InterviewTiming.notScheduled) InterviewTiming interviewTiming,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
