# provAi — proje kuralları

AI mülakat koçu (Flutter, Android + iOS). Mimari standardın tamamı:
`~/Desktop/projects-base-standards/FLUTTER_BASE.md`. Bu dosya projeye özel özet ve kararlardır.

## Komutlar

```bash
fvm flutter run --dart-define-from-file=env/dev.json        # çalıştır
dart run build_runner build -d                               # codegen (riverpod, freezed, routes)
fvm flutter gen-l10n                                         # çeviriler
fvm flutter analyze                                          # 0 uyarı zorunlu
fvm flutter test
fvm flutter build apk --release --dart-define-from-file=env/dev.json
supabase functions deploy <fn> --project-ref rkeltdlrytmvkhzuejha
```

Her zaman `fvm flutter` kullan (Flutter 3.50.1, `.fvm/fvm_config.json`).

## Mimari (özet)

- `lib/data` (services, repositories impl, DTO) · `lib/domain` (modeller, repository interface) ·
  `lib/ui/features/<feature>/{view_models,views}` · `lib/ui/core` (tema, ortak widget'lar).
- State: Riverpod 3 codegen. Ekran başına `x_state.dart` (freezed, tek seferlik `effect`) +
  `x_view_model.dart` (`@riverpod class XViewModel`) + `x_screen.dart` (effect'i `ref.listen` ile
  tüketir, navigation yapar). ViewModel `BuildContext` görmez.
- Navigation: `lib/app/router/routes.dart` typed route'lar. String path yasak.
- Repository'ler `Result<T>` döner, exception fırlatmaz. Hata tipleri `utils/app_exception.dart`.
- AI: istemci → Supabase Edge Function → Gemini. AI key yalnızca Supabase secret'ında
  (`GEMINI_API_KEY`). Sağlayıcı edge function'da tek katmanda; istemci sağlayıcıyı bilmez.
- Abonelik: `SubscriptionService` arayüzü, aktif implementasyon mock (brief statik paywall istiyor).

## Flutter 3.50 notları

- Material importu `package:material_ui/material_ui.dart`; `package:flutter/material.dart` YAZMA.
- Localizations: `GlobalMaterialLocalizations` material_ui'dan, `GlobalCupertinoLocalizations`
  cupertino_ui'dan, `GlobalWidgetsLocalizations` flutter_localizations'tan gelir.
- Freezed union alt sınıflarına public isim ver (başka dosyadan pattern match için).

## Tasarım dili: "Kırmızı Kalem"

Kâğıt zemin, mürekkep siyahı, kırmızı yalnızca düzeltme/vurgu için. Başlık Bricolage Grotesque,
gövde Inter (assets/fonts, gömülü). Token'lar `lib/ui/core/theme/`.
- Renk: `context.colors.x`, yazı: `context.textStyles.x`, boşluk: `AppSpacing`, köşe: `AppRadius`.
  Widget içinde hex, `Colors.x` veya ham `TextStyle(fontSize:)` yasak.
- Kullanıcıya görünen her metin `lib/l10n/app_tr.arb` + `app_en.arb` üzerinden (`context.l10n`).
- Dokunma alanı en az 44px, gövde metni en az 15px.
- Referans tasarım canvas'ı: https://claude.ai/artifact/9tkf3LmvvrFqrg3EeWLDYW (B satırları).

## Kurallar

- Hiçbir dosya 500 satırı geçmez (global hook uyarır). Kod İngilizce, yorumlar Türkçe.
- `const` constructor her yerde; `build()` içinde I/O veya iş mantığı yok.
- Async sonrası `if (!ref.mounted) return;` (ViewModel) / `if (!context.mounted) return;` (View).
- Generated dosyalar (`*.g.dart`, `*.freezed.dart`, `lib/l10n/gen/`) commit'lenir; değerlendiren
  build_runner çalıştırmadan derleyebilsin.
- Commit/push kullanıcı onayı olmadan yapılmaz; commit mesajlarında AI imzası yok.
- `env/*.json` git'e girmez (yalnızca `env/example.json`).
