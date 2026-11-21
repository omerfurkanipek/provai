import 'package:provai/domain/models/user_profile.dart';

/// Konuşma metrikleri: dolgu kelime sayısı ve dakikadaki kelime.
/// AI'a bağlam olarak gider, Prova ekranında canlı gösterilir.
abstract final class SpeechMetrics {
  /// Dile göre dolgu ifadeleri. "yani", "like" gibi bazen anlamlı kelimeler de
  /// var; sayım bilerek kaba tutuldu, amaç eğilimi göstermek.
  static const Map<InterviewLanguage, List<String>> _fillers = {
    InterviewLanguage.tr: [
      'eee',
      'ee',
      'ııı',
      'ıı',
      'şey',
      'hani',
      'işte',
      'yani',
    ],
    InterviewLanguage.en: [
      'you know',
      'um',
      'uh',
      'uhm',
      'erm',
      'like',
      'basically',
    ],
  };

  static List<String> _words(String text) => text
      .toLowerCase()
      .split(RegExp(r"[^\p{L}\p{N}']+", unicode: true))
      .where((w) => w.isNotEmpty)
      .toList();

  static int wordCount(String text) => _words(text).length;

  static int fillerCount(String text, InterviewLanguage language) {
    final words = _words(text);
    var count = 0;
    var i = 0;
    while (i < words.length) {
      var matched = false;
      for (final filler in _fillers[language]!) {
        final parts = filler.split(' ');
        if (i + parts.length > words.length) continue;
        var same = true;
        for (var j = 0; j < parts.length; j++) {
          if (words[i + j] != parts[j]) {
            same = false;
            break;
          }
        }
        if (same) {
          count++;
          i += parts.length;
          matched = true;
          break;
        }
      }
      if (!matched) i++;
    }
    return count;
  }

  static int? wordsPerMinute(String text, Duration duration) {
    if (duration.inSeconds < 5) return null;
    return (wordCount(text) / duration.inSeconds * 60).round();
  }
}
