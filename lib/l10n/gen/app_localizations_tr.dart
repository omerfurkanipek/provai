// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'provAi';

  @override
  String get appTagline => 'İlana özel mülakat provası';

  @override
  String get commonContinue => 'Devam';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonBack => 'Geri';

  @override
  String get errorNetwork =>
      'İnternet bağlantısı yok. Bağlantını kontrol edip tekrar dene.';

  @override
  String get errorServer =>
      'Sunucuda bir sorun oluştu. Biraz sonra tekrar dene.';

  @override
  String get errorRateLimit =>
      'Şu an çok fazla istek var. Bir dakika sonra tekrar dene.';

  @override
  String get errorUnknown => 'Beklenmeyen bir hata oluştu.';
}
