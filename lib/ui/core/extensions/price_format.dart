import 'package:intl/intl.dart';
import 'package:provai/l10n/gen/app_localizations.dart';

/// Fiyatı uygulama diline göre biçimlendirir (tr: "₺1.499,99", en: "₺1,499.99").
extension PriceFormat on AppLocalizations {
  String formatPrice(double amount, String currencyCode) {
    return NumberFormat.simpleCurrency(
      locale: localeName,
      name: currencyCode,
    ).format(amount);
  }
}
