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

  /// No description provided for @errorQuota.
  ///
  /// In tr, this message translates to:
  /// **'Bugünkü AI kullanım limitine ulaştın. Yarın tekrar dene.'**
  String get errorQuota;

  /// No description provided for @errorValidation.
  ///
  /// In tr, this message translates to:
  /// **'Gönderilen bilgi geçersiz görünüyor. Metni kontrol edip tekrar dene.'**
  String get errorValidation;

  /// No description provided for @errorAiBusy.
  ///
  /// In tr, this message translates to:
  /// **'Koç şu an çok yoğun. Birkaç saniye sonra tekrar dene.'**
  String get errorAiBusy;

  /// No description provided for @homeGreeting.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeGreetingAnonymous.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba'**
  String get homeGreetingAnonymous;

  /// No description provided for @homeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bugün neye hazırlanıyoruz?'**
  String get homeTitle;

  /// No description provided for @homeFreeLeft.
  ///
  /// In tr, this message translates to:
  /// **'{count, plural, =0{Ücretsiz provan kullanıldı} =1{1 ücretsiz prova hakkın var} other{{count} ücretsiz prova hakkın var}}'**
  String homeFreeLeft(int count);

  /// No description provided for @homePro.
  ///
  /// In tr, this message translates to:
  /// **'provAi Pro · sınırsız prova'**
  String get homePro;

  /// No description provided for @homePostingLabel.
  ///
  /// In tr, this message translates to:
  /// **'İş ilanı'**
  String get homePostingLabel;

  /// No description provided for @homePaste.
  ///
  /// In tr, this message translates to:
  /// **'Yapıştır'**
  String get homePaste;

  /// No description provided for @homePostingHint.
  ///
  /// In tr, this message translates to:
  /// **'İş ilanını buraya yapıştır ya da hazırlandığın pozisyonu birkaç cümleyle anlat.'**
  String get homePostingHint;

  /// No description provided for @homePostingCounter.
  ///
  /// In tr, this message translates to:
  /// **'{count} / {max}'**
  String homePostingCounter(int count, int max);

  /// No description provided for @homePostingTooShort.
  ///
  /// In tr, this message translates to:
  /// **'İlan çok kısa. Daha iyi sorular için en az {min} karakter yapıştır ya da alanı boş bırak.'**
  String homePostingTooShort(int min);

  /// No description provided for @homeLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Mülakat dili'**
  String get homeLanguage;

  /// No description provided for @homeQuestionCount.
  ///
  /// In tr, this message translates to:
  /// **'Soru sayısı'**
  String get homeQuestionCount;

  /// No description provided for @homeQuestionCountValue.
  ///
  /// In tr, this message translates to:
  /// **'{count} soru'**
  String homeQuestionCountValue(int count);

  /// No description provided for @homeQuestionCountLocked.
  ///
  /// In tr, this message translates to:
  /// **'Pro ile 5 veya 7 soru'**
  String get homeQuestionCountLocked;

  /// No description provided for @homeStart.
  ///
  /// In tr, this message translates to:
  /// **'Provayı başlat'**
  String get homeStart;

  /// No description provided for @homeStartLocked.
  ///
  /// In tr, this message translates to:
  /// **'Pro ile yeni prova başlat'**
  String get homeStartLocked;

  /// No description provided for @homeGenerating.
  ///
  /// In tr, this message translates to:
  /// **'Sorular ilanına göre hazırlanıyor…'**
  String get homeGenerating;

  /// No description provided for @homeCancel.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get homeCancel;

  /// No description provided for @homeRecent.
  ///
  /// In tr, this message translates to:
  /// **'Son provalar'**
  String get homeRecent;

  /// No description provided for @homeRecentEmpty.
  ///
  /// In tr, this message translates to:
  /// **'İlk provan burada görünecek.'**
  String get homeRecentEmpty;

  /// No description provided for @homeSessionMeta.
  ///
  /// In tr, this message translates to:
  /// **'{date} · {count} soru · {language}'**
  String homeSessionMeta(String date, int count, String language);

  /// No description provided for @homeSessionInProgress.
  ///
  /// In tr, this message translates to:
  /// **'Devam ediyor · {answered}/{total}'**
  String homeSessionInProgress(int answered, int total);

  /// No description provided for @homeProfile.
  ///
  /// In tr, this message translates to:
  /// **'Profil'**
  String get homeProfile;

  /// No description provided for @sessionExit.
  ///
  /// In tr, this message translates to:
  /// **'Provadan çık'**
  String get sessionExit;

  /// No description provided for @sessionProgress.
  ///
  /// In tr, this message translates to:
  /// **'Soru {current} / {total}'**
  String sessionProgress(int current, int total);

  /// No description provided for @questionTypeMotivation.
  ///
  /// In tr, this message translates to:
  /// **'Motivasyon'**
  String get questionTypeMotivation;

  /// No description provided for @questionTypeBehavioral.
  ///
  /// In tr, this message translates to:
  /// **'Davranışsal'**
  String get questionTypeBehavioral;

  /// No description provided for @questionTypeTechnical.
  ///
  /// In tr, this message translates to:
  /// **'Teknik'**
  String get questionTypeTechnical;

  /// No description provided for @questionTypeSituational.
  ///
  /// In tr, this message translates to:
  /// **'Durumsal'**
  String get questionTypeSituational;

  /// No description provided for @sessionTapToSpeak.
  ///
  /// In tr, this message translates to:
  /// **'Konuşmak için dokun'**
  String get sessionTapToSpeak;

  /// No description provided for @sessionListening.
  ///
  /// In tr, this message translates to:
  /// **'Dinliyorum'**
  String get sessionListening;

  /// No description provided for @sessionPaused.
  ///
  /// In tr, this message translates to:
  /// **'Duraklatıldı'**
  String get sessionPaused;

  /// No description provided for @sessionType.
  ///
  /// In tr, this message translates to:
  /// **'Yazarak cevapla'**
  String get sessionType;

  /// No description provided for @sessionSpeak.
  ///
  /// In tr, this message translates to:
  /// **'Sesle cevapla'**
  String get sessionSpeak;

  /// No description provided for @sessionTypeHint.
  ///
  /// In tr, this message translates to:
  /// **'Cevabını buraya yaz…'**
  String get sessionTypeHint;

  /// No description provided for @sessionTranscriptPlaceholder.
  ///
  /// In tr, this message translates to:
  /// **'Konuştukça cevabın burada belirecek.'**
  String get sessionTranscriptPlaceholder;

  /// No description provided for @sessionRestart.
  ///
  /// In tr, this message translates to:
  /// **'Baştan'**
  String get sessionRestart;

  /// No description provided for @sessionSubmit.
  ///
  /// In tr, this message translates to:
  /// **'Değerlendir'**
  String get sessionSubmit;

  /// No description provided for @sessionEvaluating.
  ///
  /// In tr, this message translates to:
  /// **'Koç cevabını okuyor…'**
  String get sessionEvaluating;

  /// No description provided for @sessionMicDenied.
  ///
  /// In tr, this message translates to:
  /// **'Mikrofon izni verilmedi. Cevabını yazarak verebilir ya da ayarlardan izin verebilirsin.'**
  String get sessionMicDenied;

  /// No description provided for @sessionMicUnavailable.
  ///
  /// In tr, this message translates to:
  /// **'Bu cihazda konuşma tanıma kullanılamıyor. Cevabını yazarak verebilirsin.'**
  String get sessionMicUnavailable;

  /// No description provided for @sessionOpenSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get sessionOpenSettings;

  /// No description provided for @sessionWpm.
  ///
  /// In tr, this message translates to:
  /// **'kelime/dk'**
  String get sessionWpm;

  /// No description provided for @sessionFillers.
  ///
  /// In tr, this message translates to:
  /// **'dolgu kelime'**
  String get sessionFillers;

  /// No description provided for @sessionIdealDuration.
  ///
  /// In tr, this message translates to:
  /// **'hedef ~2 dk'**
  String get sessionIdealDuration;

  /// No description provided for @sessionAnswerTooShort.
  ///
  /// In tr, this message translates to:
  /// **'Cevabın çok kısa. Değerlendirme için biraz daha anlat.'**
  String get sessionAnswerTooShort;

  /// No description provided for @sessionYourAnswer.
  ///
  /// In tr, this message translates to:
  /// **'Cevabın'**
  String get sessionYourAnswer;

  /// No description provided for @sessionDuration.
  ///
  /// In tr, this message translates to:
  /// **'{seconds} sn'**
  String sessionDuration(int seconds);

  /// No description provided for @sessionStrengths.
  ///
  /// In tr, this message translates to:
  /// **'İyi yaptıkların'**
  String get sessionStrengths;

  /// No description provided for @sessionImprovements.
  ///
  /// In tr, this message translates to:
  /// **'Düzeltilecekler'**
  String get sessionImprovements;

  /// No description provided for @sessionImprovedAnswer.
  ///
  /// In tr, this message translates to:
  /// **'Örnek cevap'**
  String get sessionImprovedAnswer;

  /// No description provided for @sessionShowImproved.
  ///
  /// In tr, this message translates to:
  /// **'Örnek cevabı gör'**
  String get sessionShowImproved;

  /// No description provided for @sessionImprovedLocked.
  ///
  /// In tr, this message translates to:
  /// **'Örnek cevaplar Pro\'da'**
  String get sessionImprovedLocked;

  /// No description provided for @sessionFollowUp.
  ///
  /// In tr, this message translates to:
  /// **'Mülakatçı devam etseydi:'**
  String get sessionFollowUp;

  /// No description provided for @sessionNext.
  ///
  /// In tr, this message translates to:
  /// **'Sonraki soru'**
  String get sessionNext;

  /// No description provided for @sessionFinish.
  ///
  /// In tr, this message translates to:
  /// **'Raporu gör'**
  String get sessionFinish;

  /// No description provided for @sessionExitTitle.
  ///
  /// In tr, this message translates to:
  /// **'Provadan çıkılsın mı?'**
  String get sessionExitTitle;

  /// No description provided for @sessionExitBody.
  ///
  /// In tr, this message translates to:
  /// **'Verdiğin cevaplar kaydedildi. Kaldığın yerden devam edebilirsin.'**
  String get sessionExitBody;

  /// No description provided for @sessionExitConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Çık'**
  String get sessionExitConfirm;

  /// No description provided for @sessionExitCancel.
  ///
  /// In tr, this message translates to:
  /// **'Devam et'**
  String get sessionExitCancel;

  /// No description provided for @sessionNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Bu prova bulunamadı.'**
  String get sessionNotFound;

  /// No description provided for @resultTitle.
  ///
  /// In tr, this message translates to:
  /// **'Prova raporu'**
  String get resultTitle;

  /// No description provided for @resultShare.
  ///
  /// In tr, this message translates to:
  /// **'Paylaş'**
  String get resultShare;

  /// No description provided for @resultOverall.
  ///
  /// In tr, this message translates to:
  /// **'Genel puan'**
  String get resultOverall;

  /// No description provided for @criteriaStructure.
  ///
  /// In tr, this message translates to:
  /// **'Yapı (STAR)'**
  String get criteriaStructure;

  /// No description provided for @criteriaRelevance.
  ///
  /// In tr, this message translates to:
  /// **'Alakalılık'**
  String get criteriaRelevance;

  /// No description provided for @criteriaSpecificity.
  ///
  /// In tr, this message translates to:
  /// **'Somutluk'**
  String get criteriaSpecificity;

  /// No description provided for @criteriaClarity.
  ///
  /// In tr, this message translates to:
  /// **'Netlik'**
  String get criteriaClarity;

  /// No description provided for @resultHeadlineGreat.
  ///
  /// In tr, this message translates to:
  /// **'Güçlü bir prova. Bu seviyeyi koru.'**
  String get resultHeadlineGreat;

  /// No description provided for @resultHeadlineGood.
  ///
  /// In tr, this message translates to:
  /// **'İyi bir temel. {weakest} seni geri tutuyor.'**
  String resultHeadlineGood(String weakest);

  /// No description provided for @resultHeadlineWeak.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç için iyi. Önce {weakest} üzerine çalış.'**
  String resultHeadlineWeak(String weakest);

  /// No description provided for @resultPractice.
  ///
  /// In tr, this message translates to:
  /// **'Önce bunları çalış'**
  String get resultPractice;

  /// No description provided for @resultQuestions.
  ///
  /// In tr, this message translates to:
  /// **'Soru soru'**
  String get resultQuestions;

  /// No description provided for @resultRetry.
  ///
  /// In tr, this message translates to:
  /// **'Aynı ilanla tekrar prova et'**
  String get resultRetry;

  /// No description provided for @resultHome.
  ///
  /// In tr, this message translates to:
  /// **'Ana sayfaya dön'**
  String get resultHome;

  /// No description provided for @resultShareText.
  ///
  /// In tr, this message translates to:
  /// **'provAi prova raporum: {score}/100 ({role})'**
  String resultShareText(int score, String role);

  /// No description provided for @scoreOutOf.
  ///
  /// In tr, this message translates to:
  /// **'/10'**
  String get scoreOutOf;

  /// No description provided for @scoreOutOf100.
  ///
  /// In tr, this message translates to:
  /// **'/100'**
  String get scoreOutOf100;

  /// No description provided for @profileTitle.
  ///
  /// In tr, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// No description provided for @profileEdit.
  ///
  /// In tr, this message translates to:
  /// **'Düzenle'**
  String get profileEdit;

  /// No description provided for @profileNameFallback.
  ///
  /// In tr, this message translates to:
  /// **'Aday'**
  String get profileNameFallback;

  /// No description provided for @profileSubscription.
  ///
  /// In tr, this message translates to:
  /// **'Abonelik'**
  String get profileSubscription;

  /// No description provided for @profileFreePlan.
  ///
  /// In tr, this message translates to:
  /// **'Ücretsiz plan'**
  String get profileFreePlan;

  /// No description provided for @profileFreeLeft.
  ///
  /// In tr, this message translates to:
  /// **'{left}/{total} prova kaldı'**
  String profileFreeLeft(int left, int total);

  /// No description provided for @profileUpgrade.
  ///
  /// In tr, this message translates to:
  /// **'Pro\'ya geç'**
  String get profileUpgrade;

  /// No description provided for @profileProPlan.
  ///
  /// In tr, this message translates to:
  /// **'provAi Pro'**
  String get profileProPlan;

  /// No description provided for @profileProYearly.
  ///
  /// In tr, this message translates to:
  /// **'Yıllık plan'**
  String get profileProYearly;

  /// No description provided for @profileProWeekly.
  ///
  /// In tr, this message translates to:
  /// **'Haftalık plan'**
  String get profileProWeekly;

  /// No description provided for @profileTrialUntil.
  ///
  /// In tr, this message translates to:
  /// **'Deneme {date} tarihinde bitiyor'**
  String profileTrialUntil(String date);

  /// No description provided for @profileRenewsOn.
  ///
  /// In tr, this message translates to:
  /// **'{date} tarihinde yenilenir'**
  String profileRenewsOn(String date);

  /// No description provided for @profileCompleted.
  ///
  /// In tr, this message translates to:
  /// **'Tamamlanan prova'**
  String get profileCompleted;

  /// No description provided for @profileAverage.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama puan'**
  String get profileAverage;

  /// No description provided for @profileRole.
  ///
  /// In tr, this message translates to:
  /// **'Hedef pozisyon'**
  String get profileRole;

  /// No description provided for @profileSeniority.
  ///
  /// In tr, this message translates to:
  /// **'Seviye'**
  String get profileSeniority;

  /// No description provided for @profileInterviewLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Mülakat dili'**
  String get profileInterviewLanguage;

  /// No description provided for @profileTheme.
  ///
  /// In tr, this message translates to:
  /// **'Tema'**
  String get profileTheme;

  /// No description provided for @themeSystem.
  ///
  /// In tr, this message translates to:
  /// **'Sistem'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In tr, this message translates to:
  /// **'Açık'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In tr, this message translates to:
  /// **'Koyu'**
  String get themeDark;

  /// No description provided for @profileAppLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama dili'**
  String get profileAppLanguage;

  /// No description provided for @appLanguageSystem.
  ///
  /// In tr, this message translates to:
  /// **'Cihaz dili'**
  String get appLanguageSystem;

  /// No description provided for @profileRestore.
  ///
  /// In tr, this message translates to:
  /// **'Satın alımları geri yükle'**
  String get profileRestore;

  /// No description provided for @profileTerms.
  ///
  /// In tr, this message translates to:
  /// **'Kullanım Koşulları'**
  String get profileTerms;

  /// No description provided for @profilePrivacy.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik'**
  String get profilePrivacy;

  /// No description provided for @profileReset.
  ///
  /// In tr, this message translates to:
  /// **'Verilerimi sıfırla'**
  String get profileReset;

  /// No description provided for @profileResetTitle.
  ///
  /// In tr, this message translates to:
  /// **'Tüm veriler silinsin mi?'**
  String get profileResetTitle;

  /// No description provided for @profileResetBody.
  ///
  /// In tr, this message translates to:
  /// **'Profilin, prova geçmişin ve tercihlerin bu cihazdan silinir. Bu işlem geri alınamaz.'**
  String get profileResetBody;

  /// No description provided for @profileResetConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get profileResetConfirm;

  /// No description provided for @profileCancel.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get profileCancel;

  /// No description provided for @profileSave.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get profileSave;

  /// No description provided for @profileNameLabel.
  ///
  /// In tr, this message translates to:
  /// **'Adın'**
  String get profileNameLabel;

  /// No description provided for @profileVersion.
  ///
  /// In tr, this message translates to:
  /// **'provAi {version}'**
  String profileVersion(String version);

  /// No description provided for @profileRestored.
  ///
  /// In tr, this message translates to:
  /// **'Satın alımın geri yüklendi.'**
  String get profileRestored;

  /// No description provided for @profileUpdated.
  ///
  /// In tr, this message translates to:
  /// **'Profil güncellendi.'**
  String get profileUpdated;

  /// No description provided for @paywallPurchaseFailedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Satın alma gerçekleşemedi'**
  String get paywallPurchaseFailedTitle;

  /// No description provided for @paywallPurchaseFailedBody.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme tamamlanamadı ve senden ücret alınmadı. Bu demo sürümünde mağaza bağlantısı bulunmuyor.'**
  String get paywallPurchaseFailedBody;

  /// No description provided for @commonOk.
  ///
  /// In tr, this message translates to:
  /// **'Tamam'**
  String get commonOk;

  /// No description provided for @homePostingRequired.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen önce iş ilanını ya da hazırlandığın pozisyonu anlatan bir metin gir.'**
  String get homePostingRequired;

  /// No description provided for @profileNetworkInspector.
  ///
  /// In tr, this message translates to:
  /// **'Ağ istekleri (debug)'**
  String get profileNetworkInspector;
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
