import 'package:material_ui/material_ui.dart';

/// Metindeki [quotes] ifadelerinin altını kırmızı kalemle çizer.
/// Sunucu alıntıların cevapta birebir geçtiğini doğrular; burada yine de
/// bulunamayan ya da çakışan alıntılar sessizce atlanır.
class MarkedText extends StatelessWidget {
  const MarkedText({
    required this.text,
    required this.quotes,
    required this.style,
    required this.penColor,
    super.key,
  });

  final String text;
  final List<String> quotes;
  final TextStyle style;
  final Color penColor;

  /// Saf fonksiyon: test edilebilir olsun diye widget'tan ayrı.
  static List<(int start, int end)> findRanges(
    String text,
    List<String> quotes,
  ) {
    final ranges = <(int, int)>[];
    for (final quote in quotes) {
      if (quote.trim().isEmpty) continue;
      final start = text.indexOf(quote);
      if (start < 0) continue;
      final end = start + quote.length;
      final overlaps = ranges.any((r) => start < r.$2 && end > r.$1);
      if (!overlaps) ranges.add((start, end));
    }
    ranges.sort((a, b) => a.$1.compareTo(b.$1));
    return ranges;
  }

  @override
  Widget build(BuildContext context) {
    final ranges = findRanges(text, quotes);
    final spans = <TextSpan>[];
    var cursor = 0;
    for (final (start, end) in ranges) {
      if (start > cursor) {
        spans.add(TextSpan(text: text.substring(cursor, start)));
      }
      spans.add(
        TextSpan(
          text: text.substring(start, end),
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: penColor,
            decorationThickness: 2,
          ),
        ),
      );
      cursor = end;
    }
    if (cursor < text.length) spans.add(TextSpan(text: text.substring(cursor)));
    return Text.rich(TextSpan(children: spans), style: style);
  }
}
