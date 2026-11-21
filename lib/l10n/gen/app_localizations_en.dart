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
}
