import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/profile_labels.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/ui/features/onboarding/view_models/onboarding_state.dart';
import 'package:provai/ui/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:provai/ui/features/onboarding/views/widgets/onboarding_top_bar.dart';
import 'package:provai/ui/features/onboarding/views/widgets/preparing_page.dart';
import 'package:provai/ui/features/onboarding/views/widgets/question_layout.dart';
import 'package:provai/ui/features/onboarding/views/widgets/text_questions.dart';
import 'package:provai/ui/features/onboarding/views/widgets/value_pages.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(onboardingViewModelProvider.select((s) => s.effect), (
      _,
      effect,
    ) {
      if (effect == null) return;
      switch (effect) {
        case OnboardingEffectFinished():
          const PaywallRoute(placement: PaywallPlacement.onboarding)
              .go(context);
      }
      ref.read(onboardingViewModelProvider.notifier).consumeEffect();
    });

    final state = ref.watch(onboardingViewModelProvider);
    final viewModel = ref.read(onboardingViewModelProvider.notifier);
    final step = state.step;

    return PopScope(
      // Sistem geri tuşu önce bir önceki adıma döner.
      canPop: step.index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) viewModel.back();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              OnboardingTopBar(
                step: step,
                onBack: viewModel.back,
                onSkip: viewModel.skipIntro,
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 260),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  // Varsayılan düzen sayfayı dikeyde ortalar; içerik üstten başlamalı.
                  layoutBuilder: (current, previous) => Stack(
                    alignment: Alignment.topCenter,
                    children: [...previous, ?current],
                  ),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween(
                        begin: const Offset(0.04, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: KeyedSubtree(
                    key: ValueKey(step),
                    child: _StepContent(state: state, viewModel: viewModel),
                  ),
                ),
              ),
              if (step != OnboardingStep.preparing)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.sm,
                    AppSpacing.lg,
                    AppSpacing.md,
                  ),
                  child: AppButton(
                    label: step == OnboardingStep.valueStory
                        ? context.l10n.onbStart
                        : context.l10n.commonContinue,
                    onPressed: state.canContinue ? viewModel.next : null,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepContent extends StatelessWidget {
  const _StepContent({required this.state, required this.viewModel});

  final OnboardingState state;
  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final profile = state.profile;
    return switch (state.step) {
      OnboardingStep.valueStory => const ValueStoryPage(),
      OnboardingStep.valueHow => const ValueHowPage(),
      OnboardingStep.name => NameQuestion(
        initialValue: profile.name,
        onChanged: viewModel.setName,
        onSubmitted: viewModel.next,
      ),
      OnboardingStep.role => RoleQuestion(
        initialValue: profile.targetRole,
        onChanged: viewModel.setRole,
        onSubmitted: viewModel.next,
      ),
      OnboardingStep.seniority => ChoiceQuestion<Seniority>(
        title: l10n.onbSeniorityTitle,
        subtitle: l10n.onbSenioritySubtitle,
        values: Seniority.values,
        selected: profile.seniority,
        labelOf: (v) => v.title(l10n),
        descriptionOf: (v) => v.description(l10n),
        onSelect: viewModel.setSeniority,
      ),
      OnboardingStep.language => ChoiceQuestion<InterviewLanguage>(
        title: l10n.onbLanguageTitle,
        subtitle: l10n.onbLanguageSubtitle,
        values: InterviewLanguage.values,
        selected: profile.interviewLanguage,
        labelOf: (v) => v.title(l10n),
        descriptionOf: (v) => v.description(l10n),
        onSelect: viewModel.setLanguage,
      ),
      OnboardingStep.struggle => ChoiceQuestion<Struggle>(
        title: l10n.onbStruggleTitle,
        subtitle: l10n.onbStruggleSubtitle,
        values: Struggle.values,
        selected: profile.struggle,
        labelOf: (v) => v.title(l10n),
        descriptionOf: (v) => v.description(l10n),
        onSelect: viewModel.setStruggle,
      ),
      OnboardingStep.timing => ChoiceQuestion<InterviewTiming>(
        title: l10n.onbTimingTitle,
        subtitle: l10n.onbTimingSubtitle,
        values: InterviewTiming.values,
        selected: profile.interviewTiming,
        labelOf: (v) => v.title(l10n),
        descriptionOf: (v) => v.description(l10n),
        onSelect: viewModel.setTiming,
      ),
      OnboardingStep.preparing => PreparingPage(profile: profile),
    };
  }
}
