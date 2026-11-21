import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/utils/app_exception.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeEffect with _$HomeEffect {
  const factory HomeEffect.openSession(String sessionId) =
      HomeEffectOpenSession;
  const factory HomeEffect.openPaywall() = HomeEffectOpenPaywall;

  /// İlan/pozisyon metni boşken başlatılmaya çalışıldı.
  const factory HomeEffect.postingRequired() = HomeEffectPostingRequired;
  const factory HomeEffect.showError(AppException error) = HomeEffectShowError;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required UserProfile profile,
    required InterviewLanguage language,
    required int questionCount,
    @Default('') String jobPosting,
    @Default(false) bool isPro,
    @Default(0) int startedSessions,
    @Default([]) List<InterviewSession> recentSessions,
    @Default(false) bool isGenerating,
    HomeEffect? effect,
  }) = _HomeState;

  const HomeState._();

  static const maxPostingLength = 6000;
  static const minPostingLength = 80;
  static const proQuestionCounts = [3, 5, 7];

  int get freeSessionsLeft =>
      (FreeTier.sessions - startedSessions).clamp(0, FreeTier.sessions);

  bool get canStartSession => isPro || freeSessionsLeft > 0;

  bool get isPostingEmpty => jobPosting.trim().isEmpty;

  /// Boş ilan başlatmada uyarı verir; dolu ise anlamlı uzunlukta olmalı.
  bool get isPostingTooShort {
    final length = jobPosting.trim().length;
    return length > 0 && length < minPostingLength;
  }

  bool get canSubmit => !isGenerating && !isPostingTooShort;
}
