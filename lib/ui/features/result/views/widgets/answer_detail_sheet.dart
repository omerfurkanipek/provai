import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/features/session/views/widgets/feedback_view.dart';
import 'package:provai/ui/features/session/views/widgets/question_header.dart';

/// Rapordan bir soruya dokununca o cevabın tam değerlendirmesi alttan açılır.
Future<void> showAnswerDetailSheet({
  required BuildContext context,
  required InterviewQuestion question,
  required InterviewAnswer answer,
}) {
  // Sayfa kapandıktan sonra paywall'ı açmak için dış context'e ihtiyaç var.
  final outerContext = context;
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.colors.paper,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      builder: (context, controller) => Consumer(
        builder: (context, ref, _) {
          final isPro =
              ref.watch(subscriptionStatusProvider).value?.isPro ?? false;
          return ListView(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            children: [
              QuestionCard(question: question),
              const SizedBox(height: AppSpacing.xl),
              FeedbackView(
                answer: answer,
                isPro: isPro,
                onUnlockImproved: () {
                  Navigator.of(context).pop();
                  unawaited(
                    const PaywallRoute(
                      placement: PaywallPlacement.profileUpgrade,
                    ).push<bool>(outerContext),
                  );
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
