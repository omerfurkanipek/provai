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

  @override
  String get onbSkip => 'Atla';

  @override
  String get onbStart => 'Başlayalım';

  @override
  String onbProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String get onbValue1Title =>
      'İlanı yapıştır. Konuşarak cevapla. Neyi düzelteceğini gör.';

  @override
  String get onbValue1Body =>
      'Sorular başvurduğun ilana göre hazırlanır, her cevabın bir koç gibi işaretlenir.';

  @override
  String get onbValue1PostingLabel => 'İş ilanı';

  @override
  String get onbValue1PostingTitle => 'Mid-level Flutter Developer';

  @override
  String get onbValue1PostingBody =>
      'Riverpod, CI/CD ve performans optimizasyonu deneyimi…';

  @override
  String get onbValue1Answer => '\"Performans sorununu önce profilleyerek…\"';

  @override
  String get onbValue1MarkedBefore => 'Kare süresini ';

  @override
  String get onbValue1MarkedPhrase => 'baya düşürdüm';

  @override
  String get onbValue1MarkedAfter => '.';

  @override
  String get onbValue1Fix => '→ Rakam ver: 34 ms\'den 12 ms\'ye.';

  @override
  String get onbValue2Title => 'Gerçek mülakat gibi çalış.';

  @override
  String get onbValue2Body =>
      'Soruları sesli cevaplarsın, koç her cevabı aynı kriterlerle puanlar. Böylece neyin geliştiğini görürsün.';

  @override
  String get onbValue2Point1 => 'Sesli cevap ve canlı transkript';

  @override
  String get onbValue2Point2 => 'Yapı, alakalılık, somutluk ve netlik puanı';

  @override
  String get onbValue2Point3 => 'Her soruda geliştirilmiş örnek cevap';

  @override
  String get onbNameTitle => 'Sana nasıl hitap edelim?';

  @override
  String get onbNameSubtitle =>
      'Ana sayfada ve raporlarında görünür. İstersen boş bırakabilirsin.';

  @override
  String get onbNameHint => 'Adın';

  @override
  String get onbRoleTitle => 'Hangi pozisyona hazırlanıyorsun?';

  @override
  String get onbRoleSubtitle => 'Yaz ya da aşağıdan seç.';

  @override
  String get onbRoleHint => 'Ör. Flutter Developer';

  @override
  String get onbRoleMobile => 'Mobil Geliştirici';

  @override
  String get onbRoleBackend => 'Backend Geliştirici';

  @override
  String get onbRoleFrontend => 'Frontend Geliştirici';

  @override
  String get onbRoleProduct => 'Ürün Yöneticisi';

  @override
  String get onbRoleData => 'Veri Analisti';

  @override
  String get onbRoleDesign => 'UI/UX Tasarımcı';

  @override
  String get onbSeniorityTitle => 'Hangi seviyede bir pozisyona başvuruyorsun?';

  @override
  String get onbSenioritySubtitle =>
      'Soruların zorluğunu ve beklentiyi buna göre ayarlayacağız.';

  @override
  String get seniorityIntern => 'Stajyer';

  @override
  String get seniorityInternDesc => 'Okul ve kişisel projeler';

  @override
  String get seniorityJunior => 'Junior';

  @override
  String get seniorityJuniorDesc => '0–2 yıl deneyim';

  @override
  String get seniorityMid => 'Mid-level';

  @override
  String get seniorityMidDesc => '2–5 yıl, bağımsız çalışabiliyorum';

  @override
  String get senioritySenior => 'Senior';

  @override
  String get senioritySeniorDesc => '5+ yıl, teknik kararlar alıyorum';

  @override
  String get onbLanguageTitle => 'Mülakat hangi dilde olacak?';

  @override
  String get onbLanguageSubtitle =>
      'Sorular ve geri bildirim bu dilde gelir. Sonradan değiştirebilirsin.';

  @override
  String get languageTr => 'Türkçe';

  @override
  String get languageTrDesc => 'Yerel şirketler ve Türkçe süreçler';

  @override
  String get languageEn => 'İngilizce';

  @override
  String get languageEnDesc => 'Global şirketler, uzaktan pozisyonlar';

  @override
  String get onbStruggleTitle => 'En çok neyde zorlanıyorsun?';

  @override
  String get onbStruggleSubtitle =>
      'Koçun geri bildirimlerinde buna öncelik verir.';

  @override
  String get struggleSelfIntro => 'Kendimi anlatmak';

  @override
  String get struggleSelfIntroDesc => '\"Bize biraz kendinden bahset\"';

  @override
  String get struggleTechnical => 'Teknik sorular';

  @override
  String get struggleTechnicalDesc => 'Kavramlar, tasarım kararları';

  @override
  String get struggleBehavioral => 'Davranışsal sorular';

  @override
  String get struggleBehavioralDesc => 'Çatışma, hata, takım çalışması';

  @override
  String get struggleNerves => 'Heyecan ve akıcılık';

  @override
  String get struggleNervesDesc => 'Takılmadan, net konuşmak';

  @override
  String get onbTimingTitle => 'Mülakatın ne zaman?';

  @override
  String get onbTimingSubtitle => 'Hazırlık planını buna göre kuracağız.';

  @override
  String get timingThisWeek => 'Bu hafta';

  @override
  String get timingThisWeekDesc => 'Kısa sürede yoğun prova';

  @override
  String get timingThisMonth => 'Bu ay';

  @override
  String get timingThisMonthDesc => 'Haftada birkaç düzenli oturum';

  @override
  String get timingNotScheduled => 'Henüz belli değil';

  @override
  String get timingNotScheduledDesc => 'Temelden başlayalım';

  @override
  String get onbPreparingTitle => 'Planın hazırlanıyor';

  @override
  String onbPreparingStepRole(String role) {
    return '$role mülakatlarının konuları seçiliyor';
  }

  @override
  String onbPreparingStepSeniority(String seniority) {
    return '$seniority seviyesine göre zorluk ayarlanıyor';
  }

  @override
  String onbPreparingStepStruggle(String struggle) {
    return 'Öncelikli geri bildirim: $struggle';
  }

  @override
  String get onbRoleFallback => 'Genel';

  @override
  String get paywallRestore => 'Geri yükle';

  @override
  String paywallTitleOnboardingThisWeek(String role) {
    return 'Bu haftaki $role mülakatına hazır ol.';
  }

  @override
  String paywallTitleOnboardingThisMonth(String role) {
    return '$role mülakatına bu ay hazır ol.';
  }

  @override
  String paywallTitleOnboardingLater(String role) {
    return '$role mülakatlarına şimdiden hazırlan.';
  }

  @override
  String get paywallTitleFreeLimit =>
      'Ücretsiz provan bitti. Hazırlığı yarıda bırakma.';

  @override
  String get paywallTitleDefault => 'Her cevabın, bir koçun kalemiyle.';

  @override
  String get paywallExampleLabel => 'Senin cevabın';

  @override
  String get paywallExampleBefore => 'Uygulamanın performansını ';

  @override
  String get paywallExamplePhrase => 'epey iyileştirdim';

  @override
  String get paywallExampleAfter => ' ve ekip de memnun kaldı.';

  @override
  String get paywallExampleFix =>
      '\"Epey\" yerine ölçü ver: açılış süresi 3,2 sn\'den 1,1 sn\'ye indi.';

  @override
  String get paywallFeature1 => 'Sınırsız prova, ilanına özel sorular';

  @override
  String get paywallFeature2 => 'Her cevaba puan ve yeniden yazılmış örnek';

  @override
  String get paywallFeature3 => 'İngilizce ve Türkçe mülakat provası';

  @override
  String get paywallPlanYearly => 'Yıllık';

  @override
  String get paywallPlanWeekly => 'Haftalık';

  @override
  String paywallSavings(int percent) {
    return '%$percent tasarruf';
  }

  @override
  String paywallYearlyTrialSubtitle(int days, String price) {
    return '$days gün ücretsiz, sonra $price/yıl';
  }

  @override
  String paywallYearlySubtitle(String price) {
    return '$price/yıl';
  }

  @override
  String get paywallWeeklySubtitle => 'İstediğin zaman iptal et';

  @override
  String paywallPerWeek(String price) {
    return '$price/hf';
  }

  @override
  String get paywallCtaTrial => 'Ücretsiz denemeyi başlat';

  @override
  String get paywallCtaWeekly => 'Haftalık planla devam et';

  @override
  String get paywallCtaYearly => 'Yıllık planla devam et';

  @override
  String paywallFinePrintTrial(int days) {
    return '$days gün boyunca ücret alınmaz. Deneme bitmeden iptal edebilirsin.';
  }

  @override
  String get paywallFinePrint =>
      'Abonelik, iptal edilmediği sürece otomatik yenilenir.';

  @override
  String get paywallContinueFree => 'Önce ücretsiz dene';

  @override
  String get paywallTerms => 'Kullanım Koşulları';

  @override
  String get paywallPrivacy => 'Gizlilik';

  @override
  String get paywallNothingToRestore =>
      'Geri yüklenecek bir satın alım bulunamadı.';

  @override
  String get paywallPurchaseFailed => 'İşlem tamamlanamadı. Tekrar dene.';

  @override
  String get paywallUnlocked => 'provAi Pro açıldı. İyi provalar!';

  @override
  String get errorQuota =>
      'Bugünkü AI kullanım limitine ulaştın. Yarın tekrar dene.';

  @override
  String get errorValidation =>
      'Gönderilen bilgi geçersiz görünüyor. Metni kontrol edip tekrar dene.';

  @override
  String get errorAiBusy =>
      'Koç şu an çok yoğun. Birkaç saniye sonra tekrar dene.';

  @override
  String homeGreeting(String name) {
    return 'Merhaba $name';
  }

  @override
  String get homeGreetingAnonymous => 'Merhaba';

  @override
  String get homeTitle => 'Bugün neye hazırlanıyoruz?';

  @override
  String homeFreeLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ücretsiz prova hakkın var',
      one: '1 ücretsiz prova hakkın var',
      zero: 'Ücretsiz provan kullanıldı',
    );
    return '$_temp0';
  }

  @override
  String get homePro => 'provAi Pro · sınırsız prova';

  @override
  String get homePostingLabel => 'İş ilanı';

  @override
  String get homePaste => 'Yapıştır';

  @override
  String get homePostingHint =>
      'İş ilanını buraya yapıştır ya da hazırlandığın pozisyonu birkaç cümleyle anlat.';

  @override
  String homePostingCounter(int count, int max) {
    return '$count / $max';
  }

  @override
  String homePostingTooShort(int min) {
    return 'İlan çok kısa. Daha iyi sorular için en az $min karakter yapıştır ya da alanı boş bırak.';
  }

  @override
  String get homeLanguage => 'Mülakat dili';

  @override
  String get homeQuestionCount => 'Soru sayısı';

  @override
  String homeQuestionCountValue(int count) {
    return '$count soru';
  }

  @override
  String get homeQuestionCountLocked => 'Pro ile 5 veya 7 soru';

  @override
  String get homeStart => 'Provayı başlat';

  @override
  String get homeStartLocked => 'Pro ile yeni prova başlat';

  @override
  String get homeGenerating => 'Sorular ilanına göre hazırlanıyor…';

  @override
  String get homeCancel => 'Vazgeç';

  @override
  String get homeRecent => 'Son provalar';

  @override
  String get homeRecentEmpty => 'İlk provan burada görünecek.';

  @override
  String homeSessionMeta(String date, int count, String language) {
    return '$date · $count soru · $language';
  }

  @override
  String homeSessionInProgress(int answered, int total) {
    return 'Devam ediyor · $answered/$total';
  }

  @override
  String get homeProfile => 'Profil';

  @override
  String get sessionExit => 'Provadan çık';

  @override
  String sessionProgress(int current, int total) {
    return 'Soru $current / $total';
  }

  @override
  String get questionTypeMotivation => 'Motivasyon';

  @override
  String get questionTypeBehavioral => 'Davranışsal';

  @override
  String get questionTypeTechnical => 'Teknik';

  @override
  String get questionTypeSituational => 'Durumsal';

  @override
  String get sessionTapToSpeak => 'Konuşmak için dokun';

  @override
  String get sessionListening => 'Dinliyorum';

  @override
  String get sessionPaused => 'Duraklatıldı';

  @override
  String get sessionType => 'Yazarak cevapla';

  @override
  String get sessionSpeak => 'Sesle cevapla';

  @override
  String get sessionTypeHint => 'Cevabını buraya yaz…';

  @override
  String get sessionTranscriptPlaceholder =>
      'Konuştukça cevabın burada belirecek.';

  @override
  String get sessionRestart => 'Baştan';

  @override
  String get sessionSubmit => 'Değerlendir';

  @override
  String get sessionEvaluating => 'Koç cevabını okuyor…';

  @override
  String get sessionMicDenied =>
      'Mikrofon izni verilmedi. Cevabını yazarak verebilir ya da ayarlardan izin verebilirsin.';

  @override
  String get sessionMicUnavailable =>
      'Bu cihazda konuşma tanıma kullanılamıyor. Cevabını yazarak verebilirsin.';

  @override
  String get sessionOpenSettings => 'Ayarlar';

  @override
  String get sessionWpm => 'kelime/dk';

  @override
  String get sessionFillers => 'dolgu kelime';

  @override
  String get sessionIdealDuration => 'hedef ~2 dk';

  @override
  String get sessionAnswerTooShort =>
      'Cevabın çok kısa. Değerlendirme için biraz daha anlat.';

  @override
  String get sessionYourAnswer => 'Cevabın';

  @override
  String sessionDuration(int seconds) {
    return '$seconds sn';
  }

  @override
  String get sessionStrengths => 'İyi yaptıkların';

  @override
  String get sessionImprovements => 'Düzeltilecekler';

  @override
  String get sessionImprovedAnswer => 'Örnek cevap';

  @override
  String get sessionShowImproved => 'Örnek cevabı gör';

  @override
  String get sessionImprovedLocked => 'Örnek cevaplar Pro\'da';

  @override
  String get sessionFollowUp => 'Mülakatçı devam etseydi:';

  @override
  String get sessionNext => 'Sonraki soru';

  @override
  String get sessionFinish => 'Raporu gör';

  @override
  String get sessionExitTitle => 'Provadan çıkılsın mı?';

  @override
  String get sessionExitBody =>
      'Verdiğin cevaplar kaydedildi. Kaldığın yerden devam edebilirsin.';

  @override
  String get sessionExitConfirm => 'Çık';

  @override
  String get sessionExitCancel => 'Devam et';

  @override
  String get sessionNotFound => 'Bu prova bulunamadı.';

  @override
  String get resultTitle => 'Prova raporu';

  @override
  String get resultShare => 'Paylaş';

  @override
  String get resultOverall => 'Genel puan';

  @override
  String get criteriaStructure => 'Yapı (STAR)';

  @override
  String get criteriaRelevance => 'Alakalılık';

  @override
  String get criteriaSpecificity => 'Somutluk';

  @override
  String get criteriaClarity => 'Netlik';

  @override
  String get resultHeadlineGreat => 'Güçlü bir prova. Bu seviyeyi koru.';

  @override
  String resultHeadlineGood(String weakest) {
    return 'İyi bir temel. $weakest seni geri tutuyor.';
  }

  @override
  String resultHeadlineWeak(String weakest) {
    return 'Başlangıç için iyi. Önce $weakest üzerine çalış.';
  }

  @override
  String get resultPractice => 'Önce bunları çalış';

  @override
  String get resultQuestions => 'Soru soru';

  @override
  String get resultRetry => 'Aynı ilanla tekrar prova et';

  @override
  String get resultHome => 'Ana sayfaya dön';

  @override
  String resultShareText(int score, String role) {
    return 'provAi prova raporum: $score/100 ($role)';
  }

  @override
  String get scoreOutOf => '/10';

  @override
  String get scoreOutOf100 => '/100';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileEdit => 'Düzenle';

  @override
  String get profileNameFallback => 'Aday';

  @override
  String get profileSubscription => 'Abonelik';

  @override
  String get profileFreePlan => 'Ücretsiz plan';

  @override
  String profileFreeLeft(int left, int total) {
    return '$left/$total prova kaldı';
  }

  @override
  String get profileUpgrade => 'Pro\'ya geç';

  @override
  String get profileProPlan => 'provAi Pro';

  @override
  String get profileProYearly => 'Yıllık plan';

  @override
  String get profileProWeekly => 'Haftalık plan';

  @override
  String profileTrialUntil(String date) {
    return 'Deneme $date tarihinde bitiyor';
  }

  @override
  String profileRenewsOn(String date) {
    return '$date tarihinde yenilenir';
  }

  @override
  String get profileCompleted => 'Tamamlanan prova';

  @override
  String get profileAverage => 'Ortalama puan';

  @override
  String get profileRole => 'Hedef pozisyon';

  @override
  String get profileSeniority => 'Seviye';

  @override
  String get profileInterviewLanguage => 'Mülakat dili';

  @override
  String get profileTheme => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get profileAppLanguage => 'Uygulama dili';

  @override
  String get appLanguageSystem => 'Cihaz dili';

  @override
  String get profileRestore => 'Satın alımları geri yükle';

  @override
  String get profileTerms => 'Kullanım Koşulları';

  @override
  String get profilePrivacy => 'Gizlilik';

  @override
  String get profileReset => 'Verilerimi sıfırla';

  @override
  String get profileResetTitle => 'Tüm veriler silinsin mi?';

  @override
  String get profileResetBody =>
      'Profilin, prova geçmişin ve tercihlerin bu cihazdan silinir. Bu işlem geri alınamaz.';

  @override
  String get profileResetConfirm => 'Sil';

  @override
  String get profileCancel => 'Vazgeç';

  @override
  String get profileSave => 'Kaydet';

  @override
  String get profileNameLabel => 'Adın';

  @override
  String profileVersion(String version) {
    return 'provAi $version';
  }

  @override
  String get profileRestored => 'Satın alımın geri yüklendi.';

  @override
  String get profileUpdated => 'Profil güncellendi.';

  @override
  String get paywallPurchaseFailedTitle => 'Satın alma gerçekleşemedi';

  @override
  String get paywallPurchaseFailedBody =>
      'Ödeme tamamlanamadı ve senden ücret alınmadı. Bu demo sürümünde mağaza bağlantısı bulunmuyor.';

  @override
  String get commonOk => 'Tamam';

  @override
  String get homePostingRequired =>
      'Lütfen önce iş ilanını ya da hazırlandığın pozisyonu anlatan bir metin gir.';

  @override
  String get profileNetworkInspector => 'Ağ istekleri (debug)';
}
