import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/utils/app_exception.dart';

part 'result_state.freezed.dart';

enum Criterion { structure, relevance, specificity, clarity }

@freezed
sealed class ResultEffect with _$ResultEffect {
  const factory ResultEffect.openSession(String sessionId) =
      ResultEffectOpenSession;
  const factory ResultEffect.openPaywall() = ResultEffectOpenPaywall;
  const factory ResultEffect.showError(AppException error) =
      ResultEffectShowError;
}

@freezed
abstract class ResultState with _$ResultState {
  const factory ResultState({
    required InterviewSession? session,
    @Default(false) bool isRetrying,
    ResultEffect? effect,
  }) = _ResultState;

  const ResultState._();

  Map<Criterion, double> get criteria {
    final avg = session?.averageCriteria;
    if (avg == null) return const {};
    return {
      Criterion.structure: avg.structure,
      Criterion.relevance: avg.relevance,
      Criterion.specificity: avg.specificity,
      Criterion.clarity: avg.clarity,
    };
  }

  Criterion? get weakest {
    final c = criteria;
    if (c.isEmpty) return null;
    return c.entries.reduce((a, b) => a.value <= b.value ? a : b).key;
  }

  /// En düşük puanlı cevaplardan başlayarak, her cevabın en önemli düzeltmesi.
  List<String> get practiceItems {
    final answers = [...?session?.answers]
      ..sort((a, b) => a.feedback.score.compareTo(b.feedback.score));
    return [
      for (final answer in answers)
        if (answer.feedback.improvements.isNotEmpty)
          answer.feedback.improvements.first.fix,
    ].take(3).toList();
  }
}
