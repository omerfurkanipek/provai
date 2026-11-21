import 'package:flutter_test/flutter_test.dart';
import 'package:provai/ui/features/session/views/widgets/marked_text.dart';

void main() {
  const text = 'Biraz uğraştım ama sonuçta uygulama epey hızlandı.';

  test('alıntıların konumlarını sıralı döner', () {
    expect(MarkedText.findRanges(text, ['epey hızlandı', 'Biraz uğraştım']), [
      (0, 14),
      (36, 49),
    ]);
  });

  test('metinde olmayan, boş ve çakışan alıntıları atlar', () {
    expect(
      MarkedText.findRanges(text, [
        'yok böyle bir şey',
        '',
        'uğraştım ama',
        'ama sonuçta',
      ]),
      [(6, 18)],
    );
  });
}
