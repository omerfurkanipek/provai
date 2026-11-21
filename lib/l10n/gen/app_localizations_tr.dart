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
}
