import 'package:flutter_test/flutter_test.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/use_cases/speech_metrics.dart';

void main() {
  group('fillerCount', () {
    test('Türkçe dolgu kelimelerini sayar, kelime içinde geçenleri saymaz', () {
      const text =
          'Ee şimdi ben, yani, işte projede şeylerin hepsini hallettim.';
      // ee, yani, işte → 3 ("şeylerin" sayılmaz)
      expect(SpeechMetrics.fillerCount(text, InterviewLanguage.tr), 3);
    });

    test('İngilizcede iki kelimelik ifadeyi tek sayar', () {
      const text = 'Um, you know, I basically fixed it, uh, quickly.';
      expect(SpeechMetrics.fillerCount(text, InterviewLanguage.en), 4);
    });

    test('boş metinde sıfır döner', () {
      expect(SpeechMetrics.fillerCount('', InterviewLanguage.tr), 0);
    });
  });

  test('dakikadaki kelimeyi hesaplar, çok kısa sürede null döner', () {
    final text = List.filled(60, 'kelime').join(' ');
    expect(
      SpeechMetrics.wordsPerMinute(text, const Duration(seconds: 30)),
      120,
    );
    expect(
      SpeechMetrics.wordsPerMinute(text, const Duration(seconds: 3)),
      isNull,
    );
  });
}
