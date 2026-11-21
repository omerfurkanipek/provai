/// HTTP kütüphanesinden bağımsız iptal sinyali. Domain ve UI katmanı bunu
/// kullanır; data katmanı dio'nun CancelToken'ına çevirir.
class CancelHandle {
  final _listeners = <void Function()>[];
  bool _cancelled = false;

  bool get isCancelled => _cancelled;

  void cancel() {
    if (_cancelled) return;
    _cancelled = true;
    for (final listener in List.of(_listeners)) {
      listener();
    }
    _listeners.clear();
  }

  /// İptal edildiğinde çağrılır; zaten iptal edildiyse hemen çağrılır.
  void onCancel(void Function() listener) {
    if (_cancelled) {
      listener();
    } else {
      _listeners.add(listener);
    }
  }
}
