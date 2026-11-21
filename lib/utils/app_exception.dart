/// Uygulama genelindeki hata tipleri. UI, mesajı tipe göre çeviriden seçer;
/// `debugMessage` yalnızca log içindir, kullanıcıya gösterilmez.
sealed class AppException implements Exception {
  const AppException([this.debugMessage]);
  final String? debugMessage;

  @override
  String toString() => 'AppException: ${debugMessage ?? ''}';
}

/// İnternet yok veya bağlantı zaman aşımına uğradı.
final class NetworkException extends AppException {
  const NetworkException([super.debugMessage]);
}

/// Sunucu beklenmeyen bir hata döndü.
final class ServerException extends AppException {
  const ServerException([super.debugMessage, this.statusCode]);
  final int? statusCode;
}

/// AI sağlayıcısının veya sunucunun istek limiti doldu.
final class RateLimitException extends AppException {
  const RateLimitException([super.debugMessage]);
}

/// Kullanıcının günlük AI istek kotası doldu (sunucu tarafı koruma).
final class QuotaExceededException extends AppException {
  const QuotaExceededException([super.debugMessage]);
}

/// Mağaza satın almayı tamamlamadı (demo sürümünde mağaza bağlantısı yok).
final class PurchaseFailedException extends AppException {
  const PurchaseFailedException([super.debugMessage]);
}

/// Kullanıcı girdisi geçersiz (ör. ilan metni çok kısa).
final class ValidationException extends AppException {
  const ValidationException([super.debugMessage]);
}

/// Yanıt beklenen şemaya uymadı.
final class ParseException extends AppException {
  const ParseException([super.debugMessage]);
}

/// Kullanıcı isteği iptal etti. UI bunu hata olarak göstermez.
final class CancelledException extends AppException {
  const CancelledException([super.debugMessage]);
}

final class UnknownException extends AppException {
  const UnknownException([super.debugMessage]);
}
