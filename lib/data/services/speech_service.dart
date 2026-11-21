import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_service.g.dart';

/// Cihaz üstü konuşma tanıma. Ses sunucuya gönderilmez; yalnızca metin çıkar.
///
/// Android tanıyıcısı sessizlikte kendiliğinden durabilir; bunu [statusStream]
/// üzerinden bildirir, oturumu sürdürme kararı çağıranındır.
class SpeechService {
  final SpeechToText _stt = SpeechToText();
  final _status = StreamController<String>.broadcast();
  final _errors = StreamController<String>.broadcast();
  bool _ready = false;

  Stream<String> get statusStream => _status.stream;

  /// Hata kodları: `error_permission`, `error_no_match`, `error_speech_timeout`...
  Stream<String> get errorStream => _errors.stream;

  bool get isListening => _stt.isListening;

  /// İlk çağrıda mikrofon izni ister. İzin yoksa veya cihazda tanıyıcı yoksa false.
  Future<bool> ensureReady() async {
    if (_ready) return true;
    return _ready = await _stt.initialize(
      onStatus: _status.add,
      onError: (e) => _errors.add(e.errorMsg),
    );
  }

  Future<void> start({
    required String localeId,
    required void Function(String words, {required bool isFinal}) onResult,
  }) {
    return _stt.listen(
      onResult: (result) =>
          onResult(result.recognizedWords, isFinal: result.finalResult),
      listenOptions: SpeechListenOptions(
        localeId: localeId,
        listenMode: ListenMode.dictation,
        autoPunctuation: true,
        listenFor: const Duration(minutes: 3),
        pauseFor: const Duration(seconds: 8),
      ),
    );
  }

  Future<void> stop() => _stt.stop();
  Future<void> cancel() => _stt.cancel();

  void dispose() {
    unawaited(_stt.cancel());
    unawaited(_status.close());
    unawaited(_errors.close());
  }
}

@Riverpod(keepAlive: true)
SpeechService speechService(Ref ref) {
  final service = SpeechService();
  ref.onDispose(service.dispose);
  return service;
}
