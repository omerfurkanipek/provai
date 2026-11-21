import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/utils/app_exception.dart';

/// Hata tipini kullanıcıya gösterilecek metne çevirir. `debugMessage` gösterilmez.
extension AppExceptionMessage on AppException {
  String message(AppLocalizations l10n) => switch (this) {
    NetworkException() => l10n.errorNetwork,
    QuotaExceededException() => l10n.errorQuota,
    RateLimitException() => l10n.errorAiBusy,
    ValidationException() => l10n.errorValidation,
    PurchaseFailedException() => l10n.paywallPurchaseFailedTitle,
    ServerException() || ParseException() => l10n.errorServer,
    CancelledException() || UnknownException() => l10n.errorUnknown,
  };
}
