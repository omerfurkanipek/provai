import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/l10n/gen/app_localizations.dart';

/// Domain enum'larının kullanıcıya görünen metinleri. Domain katmanı l10n bilmez;
/// eşleme UI katmanında tek yerde yapılır.
extension SeniorityLabel on Seniority {
  String title(AppLocalizations l10n) => switch (this) {
    Seniority.intern => l10n.seniorityIntern,
    Seniority.junior => l10n.seniorityJunior,
    Seniority.mid => l10n.seniorityMid,
    Seniority.senior => l10n.senioritySenior,
  };

  String description(AppLocalizations l10n) => switch (this) {
    Seniority.intern => l10n.seniorityInternDesc,
    Seniority.junior => l10n.seniorityJuniorDesc,
    Seniority.mid => l10n.seniorityMidDesc,
    Seniority.senior => l10n.senioritySeniorDesc,
  };
}

extension InterviewLanguageLabel on InterviewLanguage {
  String title(AppLocalizations l10n) => switch (this) {
    InterviewLanguage.tr => l10n.languageTr,
    InterviewLanguage.en => l10n.languageEn,
  };

  String description(AppLocalizations l10n) => switch (this) {
    InterviewLanguage.tr => l10n.languageTrDesc,
    InterviewLanguage.en => l10n.languageEnDesc,
  };
}

extension StruggleLabel on Struggle {
  String title(AppLocalizations l10n) => switch (this) {
    Struggle.selfIntro => l10n.struggleSelfIntro,
    Struggle.technical => l10n.struggleTechnical,
    Struggle.behavioral => l10n.struggleBehavioral,
    Struggle.nerves => l10n.struggleNerves,
  };

  String description(AppLocalizations l10n) => switch (this) {
    Struggle.selfIntro => l10n.struggleSelfIntroDesc,
    Struggle.technical => l10n.struggleTechnicalDesc,
    Struggle.behavioral => l10n.struggleBehavioralDesc,
    Struggle.nerves => l10n.struggleNervesDesc,
  };
}

extension InterviewTimingLabel on InterviewTiming {
  String title(AppLocalizations l10n) => switch (this) {
    InterviewTiming.thisWeek => l10n.timingThisWeek,
    InterviewTiming.thisMonth => l10n.timingThisMonth,
    InterviewTiming.notScheduled => l10n.timingNotScheduled,
  };

  String description(AppLocalizations l10n) => switch (this) {
    InterviewTiming.thisWeek => l10n.timingThisWeekDesc,
    InterviewTiming.thisMonth => l10n.timingThisMonthDesc,
    InterviewTiming.notScheduled => l10n.timingNotScheduledDesc,
  };
}
