import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appName.
  ///
  /// In tr, this message translates to:
  /// **'provAi'**
  String get appName;

  /// Splash ekranındaki slogan
  ///
  /// In tr, this message translates to:
  /// **'İlana özel mülakat provası'**
  String get appTagline;

  /// No description provided for @commonContinue.
  ///
  /// In tr, this message translates to:
  /// **'Devam'**
  String get commonContinue;

  /// No description provided for @commonRetry.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene'**
  String get commonRetry;

  /// No description provided for @commonClose.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get commonClose;

  /// No description provided for @commonBack.
  ///
  /// In tr, this message translates to:
  /// **'Geri'**
  String get commonBack;

  /// No description provided for @errorNetwork.
  ///
  /// In tr, this message translates to:
  /// **'İnternet bağlantısı yok. Bağlantını kontrol edip tekrar dene.'**
  String get errorNetwork;

  /// No description provided for @errorServer.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuda bir sorun oluştu. Biraz sonra tekrar dene.'**
  String get errorServer;

  /// No description provided for @errorRateLimit.
  ///
  /// In tr, this message translates to:
  /// **'Şu an çok fazla istek var. Bir dakika sonra tekrar dene.'**
  String get errorRateLimit;

  /// No description provided for @errorUnknown.
  ///
  /// In tr, this message translates to:
  /// **'Beklenmeyen bir hata oluştu.'**
  String get errorUnknown;

  /// No description provided for @onbSkip.
  ///
  /// In tr, this message translates to:
  /// **'Atla'**
  String get onbSkip;

  /// No description provided for @onbStart.
  ///
  /// In tr, this message translates to:
  /// **'Başlayalım'**
  String get onbStart;

  /// No description provided for @onbProgress.
  ///
  /// In tr, this message translates to:
  /// **'{current}/{total}'**
  String onbProgress(int current, int total);

  /// No description provided for @onbValue1Title.
  ///
  /// In tr, this message translates to:
  /// **'İlanı yapıştır. Konuşarak cevapla. Neyi düzelteceğini gör.'**
  String get onbValue1Title;

  /// No description provided for @onbValue1Body.
  ///
  /// In tr, this message translates to:
  /// **'Sorular başvurduğun ilana göre hazırlanır, her cevabın bir koç gibi işaretlenir.'**
  String get onbValue1Body;

  /// No description provided for @onbValue1PostingLabel.
  ///
  /// In tr, this message translates to:
  /// **'İş ilanı'**
  String get onbValue1PostingLabel;

  /// No description provided for @onbValue1PostingTitle.
  ///
  /// In tr, this message translates to:
  /// **'Mid-level Flutter Developer'**
  String get onbValue1PostingTitle;

  /// No description provided for @onbValue1PostingBody.
  ///
  /// In tr, this message translates to:
  /// **'Riverpod, CI/CD ve performans optimizasyonu deneyimi…'**
  String get onbValue1PostingBody;

  /// No description provided for @onbValue1Answer.
  ///
  /// In tr, this message translates to:
  /// **'\"Performans sorununu önce profilleyerek…\"'**
  String get onbValue1Answer;

  /// No description provided for @onbValue1MarkedBefore.
  ///
  /// In tr, this message translates to:
  /// **'Kare süresini '**
  String get onbValue1MarkedBefore;

  /// No description provided for @onbValue1MarkedPhrase.
  ///
  /// In tr, this message translates to:
  /// **'baya düşürdüm'**
  String get onbValue1MarkedPhrase;

  /// No description provided for @onbValue1MarkedAfter.
  ///
  /// In tr, this message translates to:
  /// **'.'**
  String get onbValue1MarkedAfter;

  /// No description provided for @onbValue1Fix.
  ///
  /// In tr, this message translates to:
  /// **'→ Rakam ver: 34 ms\'den 12 ms\'ye.'**
  String get onbValue1Fix;

  /// No description provided for @onbValue2Title.
  ///
  /// In tr, this message translates to:
  /// **'Gerçek mülakat gibi çalış.'**
  String get onbValue2Title;

  /// No description provided for @onbValue2Body.
  ///
  /// In tr, this message translates to:
  /// **'Soruları sesli cevaplarsın, koç her cevabı aynı kriterlerle puanlar. Böylece neyin geliştiğini görürsün.'**
  String get onbValue2Body;

  /// No description provided for @onbValue2Point1.
  ///
  /// In tr, this message translates to:
  /// **'Sesli cevap ve canlı transkript'**
  String get onbValue2Point1;

  /// No description provided for @onbValue2Point2.
  ///
  /// In tr, this message translates to:
  /// **'Yapı, alakalılık, somutluk ve netlik puanı'**
  String get onbValue2Point2;

  /// No description provided for @onbValue2Point3.
  ///
  /// In tr, this message translates to:
  /// **'Her soruda geliştirilmiş örnek cevap'**
  String get onbValue2Point3;

  /// No description provided for @onbNameTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sana nasıl hitap edelim?'**
  String get onbNameTitle;

  /// No description provided for @onbNameSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Ana sayfada ve raporlarında görünür. İstersen boş bırakabilirsin.'**
  String get onbNameSubtitle;

  /// No description provided for @onbNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Adın'**
  String get onbNameHint;

  /// No description provided for @onbRoleTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hangi pozisyona hazırlanıyorsun?'**
  String get onbRoleTitle;

  /// No description provided for @onbRoleSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Yaz ya da aşağıdan seç.'**
  String get onbRoleSubtitle;

  /// No description provided for @onbRoleHint.
  ///
  /// In tr, this message translates to:
  /// **'Ör. Flutter Developer'**
  String get onbRoleHint;

  /// No description provided for @onbRoleMobile.
  ///
  /// In tr, this message translates to:
  /// **'Mobil Geliştirici'**
  String get onbRoleMobile;

  /// No description provided for @onbRoleBackend.
  ///
  /// In tr, this message translates to:
  /// **'Backend Geliştirici'**
  String get onbRoleBackend;

  /// No description provided for @onbRoleFrontend.
  ///
  /// In tr, this message translates to:
  /// **'Frontend Geliştirici'**
  String get onbRoleFrontend;

  /// No description provided for @onbRoleProduct.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Yöneticisi'**
  String get onbRoleProduct;

  /// No description provided for @onbRoleData.
  ///
  /// In tr, this message translates to:
  /// **'Veri Analisti'**
  String get onbRoleData;

  /// No description provided for @onbRoleDesign.
  ///
  /// In tr, this message translates to:
  /// **'UI/UX Tasarımcı'**
  String get onbRoleDesign;

  /// No description provided for @onbSeniorityTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hangi seviyede bir pozisyona başvuruyorsun?'**
  String get onbSeniorityTitle;

  /// No description provided for @onbSenioritySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Soruların zorluğunu ve beklentiyi buna göre ayarlayacağız.'**
  String get onbSenioritySubtitle;

  /// No description provided for @seniorityIntern.
  ///
  /// In tr, this message translates to:
  /// **'Stajyer'**
  String get seniorityIntern;

  /// No description provided for @seniorityInternDesc.
  ///
  /// In tr, this message translates to:
  /// **'Okul ve kişisel projeler'**
  String get seniorityInternDesc;

  /// No description provided for @seniorityJunior.
  ///
  /// In tr, this message translates to:
  /// **'Junior'**
  String get seniorityJunior;

  /// No description provided for @seniorityJuniorDesc.
  ///
  /// In tr, this message translates to:
  /// **'0–2 yıl deneyim'**
  String get seniorityJuniorDesc;

  /// No description provided for @seniorityMid.
  ///
  /// In tr, this message translates to:
  /// **'Mid-level'**
  String get seniorityMid;

  /// No description provided for @seniorityMidDesc.
  ///
  /// In tr, this message translates to:
  /// **'2–5 yıl, bağımsız çalışabiliyorum'**
  String get seniorityMidDesc;

  /// No description provided for @senioritySenior.
  ///
  /// In tr, this message translates to:
  /// **'Senior'**
  String get senioritySenior;

  /// No description provided for @senioritySeniorDesc.
  ///
  /// In tr, this message translates to:
  /// **'5+ yıl, teknik kararlar alıyorum'**
  String get senioritySeniorDesc;

  /// No description provided for @onbLanguageTitle.
  ///
  /// In tr, this message translates to:
  /// **'Mülakat hangi dilde olacak?'**
  String get onbLanguageTitle;

  /// No description provided for @onbLanguageSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sorular ve geri bildirim bu dilde gelir. Sonradan değiştirebilirsin.'**
  String get onbLanguageSubtitle;

  /// No description provided for @languageTr.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get languageTr;

  /// No description provided for @languageTrDesc.
  ///
  /// In tr, this message translates to:
  /// **'Yerel şirketler ve Türkçe süreçler'**
  String get languageTrDesc;

  /// No description provided for @languageEn.
  ///
  /// In tr, this message translates to:
  /// **'İngilizce'**
  String get languageEn;

  /// No description provided for @languageEnDesc.
  ///
  /// In tr, this message translates to:
  /// **'Global şirketler, uzaktan pozisyonlar'**
  String get languageEnDesc;

  /// No description provided for @onbStruggleTitle.
  ///
  /// In tr, this message translates to:
  /// **'En çok neyde zorlanıyorsun?'**
  String get onbStruggleTitle;

  /// No description provided for @onbStruggleSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Koçun geri bildirimlerinde buna öncelik verir.'**
  String get onbStruggleSubtitle;

  /// No description provided for @struggleSelfIntro.
  ///
  /// In tr, this message translates to:
  /// **'Kendimi anlatmak'**
  String get struggleSelfIntro;

  /// No description provided for @struggleSelfIntroDesc.
  ///
  /// In tr, this message translates to:
  /// **'\"Bize biraz kendinden bahset\"'**
  String get struggleSelfIntroDesc;

  /// No description provided for @struggleTechnical.
  ///
  /// In tr, this message translates to:
  /// **'Teknik sorular'**
  String get struggleTechnical;

  /// No description provided for @struggleTechnicalDesc.
  ///
  /// In tr, this message translates to:
  /// **'Kavramlar, tasarım kararları'**
  String get struggleTechnicalDesc;

  /// No description provided for @struggleBehavioral.
  ///
  /// In tr, this message translates to:
  /// **'Davranışsal sorular'**
  String get struggleBehavioral;

  /// No description provided for @struggleBehavioralDesc.
  ///
  /// In tr, this message translates to:
  /// **'Çatışma, hata, takım çalışması'**
  String get struggleBehavioralDesc;

  /// No description provided for @struggleNerves.
  ///
  /// In tr, this message translates to:
  /// **'Heyecan ve akıcılık'**
  String get struggleNerves;

  /// No description provided for @struggleNervesDesc.
  ///
  /// In tr, this message translates to:
  /// **'Takılmadan, net konuşmak'**
  String get struggleNervesDesc;

  /// No description provided for @onbTimingTitle.
  ///
  /// In tr, this message translates to:
  /// **'Mülakatın ne zaman?'**
  String get onbTimingTitle;

  /// No description provided for @onbTimingSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hazırlık planını buna göre kuracağız.'**
  String get onbTimingSubtitle;

  /// No description provided for @timingThisWeek.
  ///
  /// In tr, this message translates to:
  /// **'Bu hafta'**
  String get timingThisWeek;

  /// No description provided for @timingThisWeekDesc.
  ///
  /// In tr, this message translates to:
  /// **'Kısa sürede yoğun prova'**
  String get timingThisWeekDesc;

  /// No description provided for @timingThisMonth.
  ///
  /// In tr, this message translates to:
  /// **'Bu ay'**
  String get timingThisMonth;

  /// No description provided for @timingThisMonthDesc.
  ///
  /// In tr, this message translates to:
  /// **'Haftada birkaç düzenli oturum'**
  String get timingThisMonthDesc;

  /// No description provided for @timingNotScheduled.
  ///
  /// In tr, this message translates to:
  /// **'Henüz belli değil'**
  String get timingNotScheduled;

  /// No description provided for @timingNotScheduledDesc.
  ///
  /// In tr, this message translates to:
  /// **'Temelden başlayalım'**
  String get timingNotScheduledDesc;

  /// No description provided for @onbPreparingTitle.
  ///
  /// In tr, this message translates to:
  /// **'Planın hazırlanıyor'**
  String get onbPreparingTitle;

  /// No description provided for @onbPreparingStepRole.
  ///
  /// In tr, this message translates to:
  /// **'{role} mülakatlarının konuları seçiliyor'**
  String onbPreparingStepRole(String role);

  /// No description provided for @onbPreparingStepSeniority.
  ///
  /// In tr, this message translates to:
  /// **'{seniority} seviyesine göre zorluk ayarlanıyor'**
  String onbPreparingStepSeniority(String seniority);

  /// No description provided for @onbPreparingStepStruggle.
  ///
  /// In tr, this message translates to:
  /// **'Öncelikli geri bildirim: {struggle}'**
  String onbPreparingStepStruggle(String struggle);

  /// No description provided for @onbRoleFallback.
  ///
  /// In tr, this message translates to:
  /// **'Genel'**
  String get onbRoleFallback;

  /// No description provided for @paywallRestore.
  ///
  /// In tr, this message translates to:
  /// **'Geri yükle'**
  String get paywallRestore;

  /// No description provided for @paywallTitleOnboardingThisWeek.
  ///
  /// In tr, this message translates to:
  /// **'Bu haftaki {role} mülakatına hazır ol.'**
  String paywallTitleOnboardingThisWeek(String role);

  /// No description provided for @paywallTitleOnboardingThisMonth.
  ///
  /// In tr, this message translates to:
  /// **'{role} mülakatına bu ay hazır ol.'**
  String paywallTitleOnboardingThisMonth(String role);

  /// No description provided for @paywallTitleOnboardingLater.
  ///
  /// In tr, this message translates to:
  /// **'{role} mülakatlarına şimdiden hazırlan.'**
  String paywallTitleOnboardingLater(String role);

  /// No description provided for @paywallTitleFreeLimit.
  ///
  /// In tr, this message translates to:
  /// **'Ücretsiz provan bitti. Hazırlığı yarıda bırakma.'**
  String get paywallTitleFreeLimit;

  /// No description provided for @paywallTitleDefault.
  ///
  /// In tr, this message translates to:
  /// **'Her cevabın, bir koçun kalemiyle.'**
  String get paywallTitleDefault;

  /// No description provided for @paywallExampleLabel.
  ///
  /// In tr, this message translates to:
  /// **'Senin cevabın'**
  String get paywallExampleLabel;

  /// No description provided for @paywallExampleBefore.
  ///
  /// In tr, this message translates to:
  /// **'Uygulamanın performansını '**
  String get paywallExampleBefore;

  /// No description provided for @paywallExamplePhrase.
  ///
  /// In tr, this message translates to:
  /// **'epey iyileştirdim'**
  String get paywallExamplePhrase;

  /// No description provided for @paywallExampleAfter.
  ///
  /// In tr, this message translates to:
  /// **' ve ekip de memnun kaldı.'**
  String get paywallExampleAfter;

  /// No description provided for @paywallExampleFix.
  ///
  /// In tr, this message translates to:
  /// **'\"Epey\" yerine ölçü ver: açılış süresi 3,2 sn\'den 1,1 sn\'ye indi.'**
  String get paywallExampleFix;

  /// No description provided for @paywallFeature1.
  ///
  /// In tr, this message translates to:
  /// **'Sınırsız prova, ilanına özel sorular'**
  String get paywallFeature1;

  /// No description provided for @paywallFeature2.
  ///
  /// In tr, this message translates to:
  /// **'Her cevaba puan ve yeniden yazılmış örnek'**
  String get paywallFeature2;

  /// No description provided for @paywallFeature3.
  ///
  /// In tr, this message translates to:
  /// **'İngilizce ve Türkçe mülakat provası'**
  String get paywallFeature3;

  /// No description provided for @paywallPlanYearly.
  ///
  /// In tr, this message translates to:
  /// **'Yıllık'**
  String get paywallPlanYearly;

  /// No description provided for @paywallPlanWeekly.
  ///
  /// In tr, this message translates to:
  /// **'Haftalık'**
  String get paywallPlanWeekly;

  /// No description provided for @paywallSavings.
  ///
  /// In tr, this message translates to:
  /// **'%{percent} tasarruf'**
  String paywallSavings(int percent);

  /// No description provided for @paywallYearlyTrialSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'{days} gün ücretsiz, sonra {price}/yıl'**
  String paywallYearlyTrialSubtitle(int days, String price);

  /// No description provided for @paywallYearlySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'{price}/yıl'**
  String paywallYearlySubtitle(String price);

  /// No description provided for @paywallWeeklySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'İstediğin zaman iptal et'**
  String get paywallWeeklySubtitle;

  /// No description provided for @paywallPerWeek.
  ///
  /// In tr, this message translates to:
  /// **'{price}/hf'**
  String paywallPerWeek(String price);

  /// No description provided for @paywallCtaTrial.
  ///
  /// In tr, this message translates to:
  /// **'Ücretsiz denemeyi başlat'**
  String get paywallCtaTrial;

  /// No description provided for @paywallCtaWeekly.
  ///
  /// In tr, this message translates to:
  /// **'Haftalık planla devam et'**
  String get paywallCtaWeekly;

  /// No description provided for @paywallCtaYearly.
  ///
  /// In tr, this message translates to:
  /// **'Yıllık planla devam et'**
  String get paywallCtaYearly;

  /// No description provided for @paywallFinePrintTrial.
  ///
  /// In tr, this message translates to:
  /// **'{days} gün boyunca ücret alınmaz. Deneme bitmeden iptal edebilirsin.'**
  String paywallFinePrintTrial(int days);

  /// No description provided for @paywallFinePrint.
  ///
  /// In tr, this message translates to:
  /// **'Abonelik, iptal edilmediği sürece otomatik yenilenir.'**
  String get paywallFinePrint;

  /// No description provided for @paywallContinueFree.
  ///
  /// In tr, this message translates to:
  /// **'Önce ücretsiz dene'**
  String get paywallContinueFree;

  /// No description provided for @paywallTerms.
  ///
  /// In tr, this message translates to:
  /// **'Kullanım Koşulları'**
  String get paywallTerms;

  /// No description provided for @paywallPrivacy.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik'**
  String get paywallPrivacy;

  /// No description provided for @paywallNothingToRestore.
  ///
  /// In tr, this message translates to:
  /// **'Geri yüklenecek bir satın alım bulunamadı.'**
  String get paywallNothingToRestore;

  /// No description provided for @paywallPurchaseFailed.
  ///
  /// In tr, this message translates to:
  /// **'İşlem tamamlanamadı. Tekrar dene.'**
  String get paywallPurchaseFailed;

  /// No description provided for @paywallUnlocked.
  ///
  /// In tr, this message translates to:
  /// **'provAi Pro açıldı. İyi provalar!'**
  String get paywallUnlocked;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
