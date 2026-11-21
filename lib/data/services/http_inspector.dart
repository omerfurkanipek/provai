import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_inspector.g.dart';

/// Debug build'e özel HTTP inspector (Android'deki Chucker'ın Flutter karşılığı).
/// Edge Function istek ve cevaplarını uygulama içinde gösterir: yüzen balona
/// dokunarak, telefonu sallayarak ya da Profil > "Ağ istekleri" ile açılır.
/// Release build'de null döner; hiçbir istek kaydedilmez.
@Riverpod(keepAlive: true)
Alice? httpInspector(Ref ref) {
  if (!kDebugMode) return null;
  return Alice(
    configuration: AliceConfiguration(
      showOverlayBubble: true,
      // JWT ekran görüntülerine ve paylaşımlara sızmasın.
      redactedHeaders: const {'authorization'},
    ),
  );
}
