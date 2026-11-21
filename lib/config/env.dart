/// Derleme zamanı ortam değerleri: `--dart-define-from-file=env/dev.json`.
/// Buradaki değerlerin hiçbiri gizli değildir. Supabase publishable key'i
/// istemciye özeldir; AI sağlayıcısının key'i yalnızca sunucudadır.
abstract final class Env {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  static bool get isConfigured =>
      supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;

  /// Edge Function'ların taban adresi.
  static String get functionsBaseUrl => '$supabaseUrl/functions/v1';
}
