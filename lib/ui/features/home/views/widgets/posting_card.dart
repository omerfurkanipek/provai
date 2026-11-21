import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/ruled_paper.dart';
import 'package:provai/ui/features/home/view_models/home_state.dart';
import 'package:provai/utils/string_x.dart';

/// Çizgili kâğıt görünümlü ilan alanı: yapıştır butonu ve karakter sayacı.
class PostingCard extends StatefulWidget {
  const PostingCard({
    required this.value,
    required this.role,
    required this.showTooShort,
    required this.enabled,
    required this.onChanged,
    super.key,
  });

  final String value;
  final String role;
  final bool showTooShort;
  final bool enabled;
  final ValueChanged<String> onChanged;

  @override
  State<PostingCard> createState() => _PostingCardState();
}

class _PostingCardState extends State<PostingCard> {
  static const _lineHeight = 26.0;
  late final _controller = TextEditingController(text: widget.value);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim();
    if (text == null || text.isEmpty || !mounted) return;
    final clipped = text.length > HomeState.maxPostingLength
        ? text.substring(0, HomeState.maxPostingLength)
        : text;
    _controller.text = clipped;
    widget.onChanged(clipped);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final length = widget.value.length;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(
          color: widget.showTooShort ? colors.pen : colors.line,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.sm,
        AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.homePostingLabel.toUpperCaseFor(l10n.localeName),
                  style: styles.caption.copyWith(color: colors.inkMuted),
                ),
              ),
              TextButton.icon(
                onPressed: widget.enabled ? _paste : null,
                icon: const Icon(PenIcons.paste, size: 16),
                label: Text(l10n.homePaste),
                style: TextButton.styleFrom(
                  foregroundColor: colors.ink,
                  backgroundColor: colors.paper,
                  textStyle: styles.label.copyWith(fontWeight: FontWeight.w600),
                  minimumSize: const Size(0, 36),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    side: BorderSide(color: colors.lineStrong),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          RuledPaper(
            lineSpacing: _lineHeight,
            offset: -2,
            child: TextField(
              controller: _controller,
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              minLines: 6,
              maxLines: 6,
              maxLength: HomeState.maxPostingLength,
              keyboardType: TextInputType.multiline,
              style: styles.bodySmall.copyWith(height: _lineHeight / 15),
              decoration: InputDecoration(
                hintText: l10n.homePostingHint(widget.role),
                hintMaxLines: 6,
                hintStyle: styles.bodySmall.copyWith(
                  color: colors.inkSubtle,
                  height: _lineHeight / 15,
                ),
                border: InputBorder.none,
                isCollapsed: true,
                counterText: '',
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              Expanded(
                child: widget.showTooShort
                    ? Text(
                        l10n.homePostingTooShort(HomeState.minPostingLength),
                        style: styles.label.copyWith(color: colors.pen),
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                l10n.homePostingCounter(length, HomeState.maxPostingLength),
                style: styles.label.copyWith(color: colors.inkSubtle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
