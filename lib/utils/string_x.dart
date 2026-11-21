/// Dile duyarlı büyük harf dönüşümü. Dart'ın `toUpperCase()` fonksiyonu
/// Türkçedeki noktalı i'yi bilmez ("ilan" → "ILAN" yazar, doğrusu "İLAN").
extension LocaleAwareCase on String {
  String toUpperCaseFor(String languageCode) {
    if (languageCode == 'tr' || languageCode == 'az') {
      return replaceAll('i', 'İ').toUpperCase();
    }
    return toUpperCase();
  }
}
