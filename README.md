# provAi

**İlana özel mülakat provası.** Başvurduğun iş ilanını yapıştırırsın; provAi o ilana göre mülakat soruları üretir, sen sesli ya da yazılı cevap verirsin, yapay zeka koç cevabını dört kriterde puanlar ve zayıf ifadelerinin altını kırmızı kalemle çizer.

## Fikir

İnternetteki "en sık sorulan 50 mülakat sorusu" listeleri başvurduğun ilanı bilmez; provAi ise ilandaki teknolojiye, kıdeme ve beklentilere göre soru sorar. Hedef kullanıcı iş arayan yeni mezunlar ve kariyer değiştirenler, özellikle İngilizce mülakata hazırlanan Türk adaylar. Gerçek mülakatta konuşarak cevap verildiği için uygulama sesli cevabı merkeze alır; süre, konuşma hızı ve dolgu kelimeleri ölçer. Kullanıcı para öder çünkü tek bir iş teklifi aylık aboneliğin yüzlerce katı değer taşır ve prova ancak tekrarla işe yarar: ilk prova ücretsiz, sınırsız prova ve örnek cevaplar Pro'da.

## Akış

| Ekran | Ne yapar |
|---|---|
| Splash | Kayıtlı profile bakıp onboarding'e ya da ana sayfaya yönlendirir. |
| Onboarding | İki değer sayfası, altı kişiselleştirme sorusu (isim, pozisyon, seviye, mülakat dili, en çok zorlanılan alan, mülakat zamanı) ve cevapları geri yansıtan "planın hazırlanıyor" adımı. Sonunda paywall. |
| Paywall | Profile göre kişisel başlık, kırmızı kalemli örnek düzeltme, yıllık (3 gün deneme) ve haftalık plan, satın al, geri yükle, Kullanım Koşulları, Gizlilik. Statik: satın alma native bir uyarıyla "gerçekleşemedi" döner. |
| Ana sayfa | Navigation bar yok. İlan alanı, mülakat dili, soru sayısı, ücretsiz hak durumu, son provalar. |
| Prova | Soru kartı, sesli cevap (canlı transkript, süre, kelime/dk, dolgu kelime) veya yazılı cevap; ardından değerlendirme kartı. |
| Rapor | 100 üzerinden puan, kriter karnesi, "önce bunları çalış" listesi, soru soru detay, paylaş, aynı ilanla tekrar prova. |
| Profil | Kullanıcı bilgisi, abonelik durumu, istatistikler, mülakat dili, tema, uygulama dili, geri yükle, yasal linkler, verileri sıfırla. |

Ücretsiz kullanıcı 1 prova (3 soru) yapar. Hak bitince yeni prova, soru sayısını değiştirme ve örnek cevaplar paywall'a yönlendirir.

## Kurulum

Gereksinimler: [FVM](https://fvm.app), Android SDK (compileSdk 37), JDK 17.

```bash
git clone https://github.com/omerfurkanipek/provai.git
cd provai
fvm install            # .fvm/fvm_config.json → Flutter 3.50.1
fvm flutter pub get
cp env/example.json env/dev.json   # Supabase URL ve publishable key'i doldur
fvm flutter run --dart-define-from-file=env/dev.json
```

Cursor / VS Code kullanıyorsan Run and Debug panelinden **provAi (dev)** yapılandırmasını seçip F5'e basman yeterli.

`env/dev.json` verilmeden çalıştırılırsa uygulama açılır, AI istekleri hata mesajı döner. Kod üretimi gerekirse:

```bash
dart run build_runner build -d   # Riverpod, freezed, json, typed routes
fvm flutter gen-l10n             # TR / EN çeviriler
```

Generated dosyalar repoda olduğu için normal çalıştırmada bu adımlar gerekmez.

### Backend (Supabase)

AI çağrıları istemciden değil, Supabase Edge Function'lardan yapılır; Gemini API key'i yalnızca Supabase secret'ında durur.

```bash
supabase link --project-ref <ref>
supabase db push --remote                       # kota tablosu + RPC
supabase secrets set GEMINI_API_KEY=<key>
supabase functions deploy generate-questions evaluate-answer --no-verify-jwt
supabase config push                            # anonim girişi açar
```

## Mimari

Flutter'ın resmi katmanlı mimarisi (UI → Data, opsiyonel Domain) ve feature bazlı UI klasörleri.

```
lib/
├── app/          bootstrap (hata yakalama, Supabase, tercihler), MaterialApp, typed router
├── config/       derleme zamanı ortam değerleri, dış linkler
├── data/         services (dio API istemcisi, AI, ses, yerel depolama, analytics), repository implementasyonları, DTO'lar
├── domain/       saf modeller (freezed), repository arayüzleri, use case'ler (konuşma metrikleri)
├── ui/
│   ├── core/     tema token'ları, ortak widget'lar, extension'lar
│   └── features/ <ekran>/view_models (state + ViewModel) ve views (ekran + widget'lar)
├── l10n/         ARB çevirileri (TR, EN)
└── utils/        Result, hata tipleri, logger
supabase/         Edge Function'lar (Deno + TypeScript) ve SQL migration'ları
```

- **State:** Riverpod 3 (codegen). Her ekranda freezed bir `State`, onu yöneten bir `ViewModel` (Notifier) ve State'i dinleyip çizen bir `Screen`. Navigasyon, mesaj gösterme gibi tek seferlik olaylar state içindeki `effect` alanıyla ekrana iletilir; ViewModel `BuildContext` görmez.
- **Hata yönetimi:** Repository'ler exception fırlatmaz, `Result<T>` (Success / Failure) döner. HTTP ve sunucu hata kodları tek yerde (`ApiClient`) uygulama hata tiplerine çevrilir; ekran mesajı tipe göre seçer.
- **Navigasyon:** go_router + go_router_builder ile tipli route'lar; string path kullanılmaz.
- **Abonelik:** `SubscriptionRepository` arayüzü. Aktif implementasyon statik demo (brief satın almanın çalışmasını istemiyor); prod'da RevenueCat implementasyonu aynı arayüze takılır, UI değişmez.
- **AI:** İstemci sağlayıcıyı bilmez. Edge Function'lar Zod ile girdiyi doğrular, kullanıcı başına günlük kotayı atomik bir SQL fonksiyonuyla düşer, Gemini'den şemalı JSON alır ve çıktıyı tekrar doğrular. İlan ve cevap metinleri prompt'ta güvenilmeyen veri olarak etiketlenir (prompt injection koruması). Bir model yoğunsa sıradaki modele geçilir: `gemini-3.5-flash-lite` → `gemini-3.1-flash-lite` → `gemini-3.5-flash`.
- **Ses:** Cihaz üstü konuşma tanıma. Ses kaydı sunucuya gitmez, yalnızca metin değerlendirilir.
- **Tasarım sistemi:** "Kırmızı Kalem" dili: kâğıt zemin, mürekkep metin, kırmızı yalnızca düzeltme ve vurgu için. Renk, tipografi, boşluk ve köşe değerleri `ThemeExtension` token'larında; widget'larda sabit renk veya font boyutu yok. Açık ve koyu tema, cihaz yazı boyutundan bağımsız sabit ölçek, tablette ortalanmış içerik.

## Paketler

| Paket | Neden |
|---|---|
| flutter_riverpod, riverpod_annotation, riverpod_generator | State yönetimi ve bağımlılık enjeksiyonu |
| go_router, go_router_builder | Tipli navigasyon |
| freezed, json_serializable | Değişmez modeller, sealed state/effect, JSON |
| dio | HTTP, zaman aşımı, istek iptali |
| supabase_flutter | Anonim oturum (sunucu tarafı kota için) |
| speech_to_text, permission_handler | Cihaz üstü sesli cevap, izin ayarlarına yönlendirme |
| shared_preferences | Profil, prova geçmişi ve tercihlerin cihazda saklanması |
| flutter_animate | Giriş ve geri bildirim animasyonları |
| url_launcher, share_plus, package_info_plus | Yasal linkler, rapor paylaşımı, sürüm bilgisi |
| intl, flutter_localizations | TR / EN çeviri, tarih ve para biçimi |
| logger | Debug log'ları |
| very_good_analysis, riverpod_lint, mocktail | Lint kuralları ve testler |
| flutter_launcher_icons, flutter_native_splash | Uygulama ikonu ve açılış ekranı |

## Testler

```bash
fvm flutter analyze   # 0 uyarı
fvm flutter test      # 53 test
```

- ViewModel testleri: onboarding akışı, paywall satın alma/geri yükleme, tema tercihi.
- Widget testleri: paywall'da brief'in istediği tüm öğeler; 7 ekranın 4 farklı ekran boyutunda (320×568'den 800×1280'e) taşmadan çizilmesi.
- Saf fonksiyon testleri: dolgu kelime ve konuşma hızı, Türkçe büyük harf dönüşümü, kırmızı kalem alıntı eşleştirme.

## Bilinen sınırlar

- iOS projesi yapılandırıldı (izin metinleri, ikon, splash) ancak geliştirme makinesinde Xcode olmadığı için iOS'ta derlenip test edilmedi.
- Gemini'nin ücretsiz katmanında ara ara yoğunluk (503) yaşanabiliyor; yedek model zinciri bunu büyük ölçüde karşılıyor. Prod'da faturalandırılmış bir katman kullanılır.
- Ücretsiz hak sayacı cihazda tutuluyor (statik paywall kapsamına uygun). Prod'da hak sunucuda tutulur.

## Geliştirmede AI araçları

Bu proje geliştirilirken Anthropic'in Claude Code aracı kullanıldı: mimari standardın Android/iOS projelerimdeki standartlardan Flutter'a uyarlanması, kod yazımı, testler, Edge Function'lar ve tasarım taslakları. Ürün fikri, tasarım yönü seçimi, kapsam kararları ve gerçek cihazdaki testler bana aittir. Uygulamanın içindeki yapay zeka özelliği Google Gemini API'sini kullanır.
