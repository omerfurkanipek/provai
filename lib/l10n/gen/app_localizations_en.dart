// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'provAi';

  @override
  String get appTagline => 'Mock interviews built from the job posting';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonClose => 'Close';

  @override
  String get commonBack => 'Back';

  @override
  String get errorNetwork =>
      'No internet connection. Check your connection and try again.';

  @override
  String get errorServer =>
      'Something went wrong on our side. Please try again shortly.';

  @override
  String get errorRateLimit =>
      'Too many requests right now. Try again in a minute.';

  @override
  String get errorUnknown => 'Something unexpected happened.';

  @override
  String get onbSkip => 'Skip';

  @override
  String get onbStart => 'Let\'s start';

  @override
  String onbProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String get onbValue1Title =>
      'Paste the posting. Answer out loud. See what to fix.';

  @override
  String get onbValue1Body =>
      'Questions come from the job you\'re applying for, and every answer gets marked up like a coach would.';

  @override
  String get onbValue1PostingLabel => 'Job posting';

  @override
  String get onbValue1PostingTitle => 'Mid-level Flutter Developer';

  @override
  String get onbValue1PostingBody =>
      'Experience with Riverpod, CI/CD and performance tuning…';

  @override
  String get onbValue1Answer =>
      '\"I started by profiling the performance issue…\"';

  @override
  String get onbValue1MarkedBefore => 'I cut frame time ';

  @override
  String get onbValue1MarkedPhrase => 'by a lot';

  @override
  String get onbValue1MarkedAfter => '.';

  @override
  String get onbValue1Fix => '→ Give a number: 34 ms down to 12 ms.';

  @override
  String get onbValue2Title => 'Practice like it\'s the real thing.';

  @override
  String get onbValue2Body =>
      'You answer out loud and the coach scores every answer on the same criteria, so you can see what improves.';

  @override
  String get onbValue2Point1 => 'Spoken answers with a live transcript';

  @override
  String get onbValue2Point2 =>
      'Scores for structure, relevance, specificity and clarity';

  @override
  String get onbValue2Point3 => 'An improved sample answer for every question';

  @override
  String get onbNameTitle => 'What should we call you?';

  @override
  String get onbNameSubtitle =>
      'Shown on your home screen and reports. You can leave it empty.';

  @override
  String get onbNameHint => 'Your name';

  @override
  String get onbRoleTitle => 'Which role are you preparing for?';

  @override
  String get onbRoleSubtitle => 'Type it or pick one below.';

  @override
  String get onbRoleHint => 'e.g. Flutter Developer';

  @override
  String get onbRoleMobile => 'Mobile Developer';

  @override
  String get onbRoleBackend => 'Backend Developer';

  @override
  String get onbRoleFrontend => 'Frontend Developer';

  @override
  String get onbRoleProduct => 'Product Manager';

  @override
  String get onbRoleData => 'Data Analyst';

  @override
  String get onbRoleDesign => 'UI/UX Designer';

  @override
  String get onbSeniorityTitle => 'What level is the role?';

  @override
  String get onbSenioritySubtitle =>
      'We\'ll tune question difficulty and expectations to it.';

  @override
  String get seniorityIntern => 'Intern';

  @override
  String get seniorityInternDesc => 'School and personal projects';

  @override
  String get seniorityJunior => 'Junior';

  @override
  String get seniorityJuniorDesc => '0–2 years of experience';

  @override
  String get seniorityMid => 'Mid-level';

  @override
  String get seniorityMidDesc => '2–5 years, I work independently';

  @override
  String get senioritySenior => 'Senior';

  @override
  String get senioritySeniorDesc => '5+ years, I make technical decisions';

  @override
  String get onbLanguageTitle => 'Which language is the interview in?';

  @override
  String get onbLanguageSubtitle =>
      'Questions and feedback will be in this language. You can change it later.';

  @override
  String get languageTr => 'Turkish';

  @override
  String get languageTrDesc => 'Local companies and Turkish processes';

  @override
  String get languageEn => 'English';

  @override
  String get languageEnDesc => 'Global companies, remote roles';

  @override
  String get onbStruggleTitle => 'What do you struggle with most?';

  @override
  String get onbStruggleSubtitle =>
      'Your coach will prioritize it in feedback.';

  @override
  String get struggleSelfIntro => 'Introducing myself';

  @override
  String get struggleSelfIntroDesc => '\"Tell us a bit about yourself\"';

  @override
  String get struggleTechnical => 'Technical questions';

  @override
  String get struggleTechnicalDesc => 'Concepts, design decisions';

  @override
  String get struggleBehavioral => 'Behavioral questions';

  @override
  String get struggleBehavioralDesc => 'Conflict, mistakes, teamwork';

  @override
  String get struggleNerves => 'Nerves and fluency';

  @override
  String get struggleNervesDesc => 'Speaking clearly without stalling';

  @override
  String get onbTimingTitle => 'When is your interview?';

  @override
  String get onbTimingSubtitle => 'We\'ll shape your prep plan around it.';

  @override
  String get timingThisWeek => 'This week';

  @override
  String get timingThisWeekDesc => 'Intense practice in a short time';

  @override
  String get timingThisMonth => 'This month';

  @override
  String get timingThisMonthDesc => 'A few regular sessions a week';

  @override
  String get timingNotScheduled => 'Not scheduled yet';

  @override
  String get timingNotScheduledDesc => 'Let\'s start from the basics';

  @override
  String get onbPreparingTitle => 'Building your plan';

  @override
  String onbPreparingStepRole(String role) {
    return 'Picking topics asked in $role interviews';
  }

  @override
  String onbPreparingStepSeniority(String seniority) {
    return 'Tuning difficulty for $seniority';
  }

  @override
  String onbPreparingStepStruggle(String struggle) {
    return 'Feedback priority: $struggle';
  }

  @override
  String get onbRoleFallback => 'General';

  @override
  String get paywallRestore => 'Restore';

  @override
  String paywallTitleOnboardingThisWeek(String role) {
    return 'Get ready for this week\'s $role interview.';
  }

  @override
  String paywallTitleOnboardingThisMonth(String role) {
    return 'Be ready for your $role interview this month.';
  }

  @override
  String paywallTitleOnboardingLater(String role) {
    return 'Start preparing for $role interviews now.';
  }

  @override
  String get paywallTitleFreeLimit =>
      'Your free mock is done. Don\'t stop halfway.';

  @override
  String get paywallTitleDefault => 'Every answer, marked by a coach.';

  @override
  String get paywallExampleLabel => 'Your answer';

  @override
  String get paywallExampleBefore => 'I ';

  @override
  String get paywallExamplePhrase => 'improved the app\'s performance a lot';

  @override
  String get paywallExampleAfter => ' and the team was happy.';

  @override
  String get paywallExampleFix =>
      'Replace \"a lot\" with a number: launch time dropped from 3.2 s to 1.1 s.';

  @override
  String get paywallFeature1 =>
      'Unlimited mocks with questions from your posting';

  @override
  String get paywallFeature2 =>
      'A score and a rewritten sample for every answer';

  @override
  String get paywallFeature3 => 'Practice in English and Turkish';

  @override
  String get paywallPlanYearly => 'Yearly';

  @override
  String get paywallPlanWeekly => 'Weekly';

  @override
  String paywallSavings(int percent) {
    return 'Save $percent%';
  }

  @override
  String paywallYearlyTrialSubtitle(int days, String price) {
    return '$days days free, then $price/year';
  }

  @override
  String paywallYearlySubtitle(String price) {
    return '$price/year';
  }

  @override
  String get paywallWeeklySubtitle => 'Cancel anytime';

  @override
  String paywallPerWeek(String price) {
    return '$price/wk';
  }

  @override
  String get paywallCtaTrial => 'Start free trial';

  @override
  String get paywallCtaWeekly => 'Continue with weekly';

  @override
  String get paywallCtaYearly => 'Continue with yearly';

  @override
  String paywallFinePrintTrial(int days) {
    return 'No charge for $days days. Cancel before the trial ends.';
  }

  @override
  String get paywallFinePrint =>
      'Subscription renews automatically unless cancelled.';

  @override
  String get paywallContinueFree => 'Try it free first';

  @override
  String get paywallTerms => 'Terms of Use';

  @override
  String get paywallPrivacy => 'Privacy';

  @override
  String get paywallNothingToRestore => 'No purchases found to restore.';

  @override
  String get paywallPurchaseFailed =>
      'Couldn\'t complete that. Please try again.';

  @override
  String get paywallUnlocked => 'provAi Pro is unlocked. Happy practicing!';
}
