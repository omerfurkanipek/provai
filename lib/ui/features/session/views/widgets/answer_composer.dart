import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/use_cases/speech_metrics.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/ruled_paper.dart';
import 'package:provai/ui/features/session/view_models/session_state.dart';
import 'package:provai/ui/features/session/views/widgets/record_button.dart';

/// Cevap alanı: sesli modda canlı transkript + metrikler + kayıt kontrolleri,
/// yazılı modda çizgili metin alanı.
class AnswerComposer extends StatelessWidget {
  const AnswerComposer({
    required this.state,
    required this.language,
    required this.onToggleRecording,
    required this.onRestart,
    required this.onModeChanged,
    required this.onTypedChanged,
    this.compact = false,
    super.key,
  });

  /// Kısa ekran: boşluklar ve kayıt butonu küçülür.
  final bool compact;
  final SessionState state;
  final InterviewLanguage language;
  final VoidCallback onToggleRecording;
  final VoidCallback onRestart;
  final ValueChanged<AnswerInputMode> onModeChanged;
  final ValueChanged<String> onTypedChanged;

  @override
  Widget build(BuildContext context) {
    final isVoice = state.inputMode == AnswerInputMode.voice;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.mic == MicAvailability.denied ||
            state.mic == MicAvailability.unavailable)
          _MicNotice(denied: state.mic == MicAvailability.denied),
        Expanded(
          child: isVoice
              ? _VoiceTranscript(state: state)
              : _TypedAnswer(
                  // Soru değişince alan sıfırlansın.
                  key: ValueKey(state.currentIndex),
                  initialValue: state.typedAnswer,
                  onChanged: onTypedChanged,
                ),
        ),
        const SizedBox(height: AppSpacing.sm),
        if (isVoice) ...[
          _Metrics(state: state, language: language),
          SizedBox(height: compact ? AppSpacing.xs : AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _SideAction(
                  icon: PenIcons.keyboard,
                  label: context.l10n.sessionType,
                  onTap: () => onModeChanged(AnswerInputMode.text),
                ),
              ),
              RecordButton(
                isListening: state.recording == RecordingState.listening,
                onPressed: onToggleRecording,
                size: compact ? 72 : 96,
              ),
              Expanded(
                child: _SideAction(
                  icon: PenIcons.retry,
                  label: context.l10n.sessionRestart,
                  onTap: state.spokenTranscript.isEmpty ? null : onRestart,
                ),
              ),
            ],
          ),
        ] else if (state.mic != MicAvailability.denied &&
            state.mic != MicAvailability.unavailable)
          Align(
            child: TextButton.icon(
              onPressed: () => onModeChanged(AnswerInputMode.voice),
              icon: const Icon(PenIcons.mic, size: 18),
              label: Text(context.l10n.sessionSpeak),
              style: TextButton.styleFrom(foregroundColor: context.colors.ink),
            ),
          ),
      ],
    );
  }
}

class _VoiceTranscript extends StatelessWidget {
  const _VoiceTranscript({required this.state});

  final SessionState state;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final hasText = state.spokenTranscript.isNotEmpty;
    final content = hasText
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(text: state.committedTranscript),
                if (state.partialTranscript.isNotEmpty)
                  TextSpan(
                    text:
                        '${state.committedTranscript.isEmpty ? '' : ' '}'
                        '${state.partialTranscript}',
                    style: TextStyle(color: colors.inkMuted),
                  ),
              ],
            ),
            style: styles.bodyLarge.copyWith(height: 28 / 17),
          )
        : Text(
            state.recording == RecordingState.listening
                ? context.l10n.sessionListening
                : context.l10n.sessionTranscriptPlaceholder,
            style: styles.bodyLarge.copyWith(
              color: colors.inkSubtle,
              height: 28 / 17,
            ),
          );
    return _PaperBox(
      // reverse: uzun transkriptte en son söylenen görünür kalır; minHeight +
      // Align kısa metnin kutunun altına düşmesini engeller.
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Align(alignment: Alignment.topLeft, child: content),
          ),
        ),
      ),
    );
  }
}

class _TypedAnswer extends StatefulWidget {
  const _TypedAnswer({
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;

  @override
  State<_TypedAnswer> createState() => _TypedAnswerState();
}

class _TypedAnswerState extends State<_TypedAnswer> {
  // Sesten taşınan metinde imleç sonda başlasın, kullanıcı devam edebilsin.
  late final _controller = TextEditingController.fromValue(
    TextEditingValue(
      text: widget.initialValue,
      selection: TextSelection.collapsed(offset: widget.initialValue.length),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;
    return _PaperBox(
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        autofocus: true,
        expands: true,
        maxLines: null,
        maxLength: 6000,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        style: styles.bodyLarge.copyWith(height: 28 / 17),
        decoration: InputDecoration(
          hintText: context.l10n.sessionTypeHint,
          hintStyle: styles.bodyLarge.copyWith(
            color: context.colors.inkSubtle,
            height: 28 / 17,
          ),
          border: InputBorder.none,
          isCollapsed: true,
          counterText: '',
        ),
      ),
    );
  }
}

class _PaperBox extends StatelessWidget {
  const _PaperBox({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: colors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: RuledPaper(
        lineSpacing: 28,
        offset: AppSpacing.md - 2,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: child,
        ),
      ),
    );
  }
}

class _Metrics extends StatelessWidget {
  const _Metrics({required this.state, required this.language});

  final SessionState state;
  final InterviewLanguage language;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = state.spokenTranscript;
    final elapsed = Duration(seconds: state.elapsedSeconds);
    final wpm = SpeechMetrics.wordsPerMinute(text, elapsed);
    final fillers = SpeechMetrics.fillerCount(text, language);
    final minutes = elapsed.inMinutes.toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return Row(
      children: [
        Expanded(
          child: _Metric(
            value: '$minutes:$seconds',
            label: l10n.sessionIdealDuration,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: _Metric(value: wpm?.toString() ?? '–', label: l10n.sessionWpm),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: _Metric(
            value: '$fillers',
            label: l10n.sessionFillers,
            highlight: fillers >= 3,
          ),
        ),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.value,
    required this.label,
    this.highlight = false,
  });

  final String value;
  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs + 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: colors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: context.textStyles.titleSmall.copyWith(
              color: highlight ? colors.pen : colors.ink,
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.label.copyWith(color: colors.inkMuted),
          ),
        ],
      ),
    );
  }
}

class _SideAction extends StatelessWidget {
  const _SideAction({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = onTap == null
        ? context.colors.inkSubtle
        : context.colors.inkMuted;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(0, 56),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: context.textStyles.label.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class _MicNotice extends StatelessWidget {
  const _MicNotice({required this.denied});

  final bool denied;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.sm,
        AppSpacing.xs,
        AppSpacing.xs,
        AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colors.penSoft,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              denied
                  ? context.l10n.sessionMicDenied
                  : context.l10n.sessionMicUnavailable,
              style: context.textStyles.label.copyWith(color: colors.ink),
            ),
          ),
          if (denied)
            TextButton(
              // İzin kalıcı reddedildiyse tekrar sorulamaz; ayarlardan açılır.
              onPressed: openAppSettings,
              style: TextButton.styleFrom(foregroundColor: colors.pen),
              child: Text(context.l10n.sessionOpenSettings),
            ),
        ],
      ),
    );
  }
}
