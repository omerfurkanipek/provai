import 'dart:async';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';

/// Büyük kayıt butonu. Dinlerken kırmızı kalem rengine döner ve nefes alır gibi
/// atan bir halka gösterir; dokunuşta hafif titreşim verir.
class RecordButton extends StatefulWidget {
  const RecordButton({
    required this.isListening,
    required this.onPressed,
    this.size = 96,
    super.key,
  });

  final bool isListening;
  final VoidCallback onPressed;

  /// Dış halka dahil toplam boyut; iç buton bunun ~%80'i.
  final double size;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton>
    with SingleTickerProviderStateMixin {
  late final _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  @override
  void initState() {
    super.initState();
    if (widget.isListening) _pulse.repeat();
  }

  @override
  void didUpdateWidget(RecordButton old) {
    super.didUpdateWidget(old);
    if (widget.isListening && !_pulse.isAnimating) {
      _pulse.repeat();
    } else if (!widget.isListening && _pulse.isAnimating) {
      _pulse
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final active = widget.isListening;
    final fill = active ? colors.pen : colors.ink;
    final label = active
        ? context.l10n.sessionListening
        : context.l10n.sessionTapToSpeak;

    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: () {
          unawaited(HapticFeedback.mediumImpact());
          widget.onPressed();
        },
        child: SizedBox.square(
          dimension: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _pulse,
                builder: (context, _) {
                  final t = _pulse.value;
                  final inner = widget.size * 0.79;
                  return Container(
                    width: inner + (widget.size - inner) * t,
                    height: inner + (widget.size - inner) * t,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.pen.withValues(
                        alpha: active ? 0.25 * (1 - t) : 0,
                      ),
                    ),
                  );
                },
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.size * 0.79,
                height: widget.size * 0.79,
                decoration: BoxDecoration(color: fill, shape: BoxShape.circle),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  child: Icon(
                    active ? PenIcons.stop : PenIcons.mic,
                    key: ValueKey(active),
                    size: widget.size / 3,
                    color: colors.onInk,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
