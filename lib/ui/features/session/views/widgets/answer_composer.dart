import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/use_cases/speech_metrics.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/ruled_paper.dart';
import 'package:provai/ui/features/session/view_models/session_state.dart';
import 'package:provai/ui/features/session/views/widgets/record_button.dart';

/// Tek cevap alanı: her zaman klavyeyle yazılabilir; mikrofonla konuşulan
/// metin de aynı alana eklenir. Böylece sesle başlayıp klavyeyle düzeltmek
/// (ya da tersi) için mod değiştirmek gerekmez.
class AnswerComposer extends StatefulWidget {
  const AnswerComposer({
    required this.state,
    required this.language,
    required this.onToggleRecording,
    required this.onRestart,
    required this.onEdited,
    required this.onFieldFocused,
    this.compact = false,
    super.key,
  });

  final SessionState state;
  final InterviewLanguage language;
  final VoidCallback onToggleRecording;
  final VoidCallback onRestart;
  final ValueChanged<String> onEdited;

  /// Alana odaklanıldı (dinleme sürüyorsa durdurulması için).
  final VoidCallback onFieldFocused;

  /// Kısa ekran: boşluklar ve kayıt butonu küçülür.
  final bool compact;

  @override
  State<AnswerComposer> createState() => _AnswerComposerState();
}

class _AnswerComposerState extends State<AnswerComposer> {
  late final _controller = TextEditingController(
    text: widget.state.displayText,
  );
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) widget.onFieldFocused();
    });
  }

  @override
  void didUpdateWidget(AnswerComposer old) {
    super.didUpdateWidget(old);
    // Konuşulan metin (veya "Baştan") alana yansıtılır. Kullanıcı klavyeyle
    // yazarken alanın metnine dokunulmaz; imleç kaymasın.
    final text = widget.state.displayText;
    final listening = widget.state.recording == RecordingState.listening;
    if (text != _controller.text && (listening || !_focusNode.hasFocus)) {
      _controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final l10n = context.l10n;
    final micBlocked =
        state.mic == MicAvailability.denied ||
        state.mic == MicAvailability.unavailable;
    final listening = state.recording == RecordingState.listening;
    // Scaffold klavye yüksekliğini alt widget'lardan gizler (viewInsets = 0);
    // bu yüzden doğrudan pencereden okunur.
    final keyboardOpen = View.of(context).viewInsets.bottom > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (micBlocked) _MicNotice(denied: state.mic == MicAvailability.denied),
        Expanded(child: _answerField(context, listening: listening)),
        // Klavye açıkken metrikler ve kayıt kontrolleri gizlenir; ekran cevaba kalır.
        if (!keyboardOpen) ...[
          const SizedBox(height: AppSpacing.sm),
          _Metrics(state: state, language: widget.language),
          SizedBox(height: widget.compact ? AppSpacing.xs : AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _SideAction(
                  icon: PenIcons.keyboard,
                  label: l10n.sessionType,
                  onTap: _focusNode.requestFocus,
                ),
              ),
              if (micBlocked)
                SizedBox.square(dimension: widget.compact ? 72 : 96)
              else
                RecordButton(
                  isListening: listening,
                  onPressed: () {
                    // Kayda başlarken klavyeyi kapat; metin alana akmaya devam eder.
                    _focusNode.unfocus();
                    widget.onToggleRecording();
                  },
                  size: widget.compact ? 72 : 96,
                ),
              Expanded(
                child: _SideAction(
                  icon: PenIcons.retry,
                  label: l10n.sessionRestart,
                  onTap: state.displayText.isEmpty ? null : widget.onRestart,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _answerField(BuildContext context, {required bool listening}) {
    final colors = context.colors;
    final styles = context.textStyles;
    final lineStyle = styles.bodyLarge.copyWith(height: 28 / 17);
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: listening ? colors.pen : colors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: RuledPaper(
        lineSpacing: 28,
        offset: AppSpacing.md - 2,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onEdited,
            expands: true,
            maxLines: null,
            maxLength: 6000,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            style: lineStyle,
            decoration: InputDecoration(
              hintText: listening
                  ? context.l10n.sessionListening
                  : context.l10n.sessionTranscriptPlaceholder,
              hintStyle: lineStyle.copyWith(color: colors.inkSubtle),
              hintMaxLines: 3,
              border: InputBorder.none,
              isCollapsed: true,
              counterText: '',
            ),
          ),
        ),
      ),
    );
  }
}

class _Metrics extends StatelessWidget {
  const _Metrics({required this.state, required this.language});

  final SessionState state;
  final InterviewLanguage language;

  /// Hız, bu kadar veri birikmeden gösterilmez: ilk saniyelerdeki birkaç kelime
  /// sayıyı anlamsızca oynatır.
  static const _minSecondsForPace = 15;
  static const _minWordsForPace = 10;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = state.displayText;
    final elapsed = Duration(seconds: state.elapsedSeconds);
    final enoughData =
        state.usedVoice &&
        elapsed.inSeconds >= _minSecondsForPace &&
        SpeechMetrics.wordCount(text) >= _minWordsForPace;
    final wpm = enoughData ? SpeechMetrics.wordsPerMinute(text, elapsed) : null;
    final fillers = SpeechMetrics.fillerCount(text, language);
    final minutes = elapsed.inMinutes.toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Semantics(
      button: true,
      label: l10n.metricsInfoTitle,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _showMetricsInfo(context),
        // Etiket iki satıra inerse kutular eşit yükseklikte kalsın.
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _Metric(
                  value: '$minutes:$seconds',
                  label: l10n.metricDurationLabel,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: _Metric(
                  value: wpm?.toString() ?? '–',
                  label: l10n.metricPaceLabel,
                  // İdeal aralığın dışındaysa kırmızı kalem.
                  highlight: wpm != null && (wpm < 110 || wpm > 160),
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: _Metric(
                  value: '$fillers',
                  label: l10n.metricFillersLabel,
                  highlight: fillers >= 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMetricsInfo(BuildContext context) {
    final l10n = context.l10n;
    final styles = context.textStyles;
    final colors = context.colors;
    Widget item(String title, String body) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: styles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(body, style: styles.bodySmall.copyWith(color: colors.inkMuted)),
        ],
      ),
    );
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: colors.paper,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.metricsInfoTitle, style: styles.titleSmall),
              const SizedBox(height: AppSpacing.md),
              item(l10n.metricDurationTitle, l10n.metricDurationBody),
              item(l10n.metricPaceTitle, l10n.metricPaceBody),
              item(l10n.metricFillersTitle, l10n.metricFillersBody),
            ],
          ),
        ),
      ),
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
            maxLines: 2,
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
