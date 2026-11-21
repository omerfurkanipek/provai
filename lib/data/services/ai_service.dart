import 'package:provai/data/models/ai_dtos.dart';
import 'package:provai/data/services/api_client.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_service.g.dart';

/// AI Edge Function'larının istemci tarafı. Sağlayıcıyı (Gemini) bilmez.
class AiService {
  const AiService(this._api);

  final ApiClient _api;

  Future<Result<GenerateQuestionsResponseDto>> generateQuestions({
    required CandidateDto candidate,
    required String jobPosting,
    required int questionCount,
    CancelHandle? cancel,
  }) {
    return _api.post(
      'generate-questions',
      {
        ...candidate.toJson(),
        'jobPosting': jobPosting,
        'questionCount': questionCount,
      },
      parse: GenerateQuestionsResponseDto.fromJson,
      cancel: cancel,
    );
  }

  Future<Result<EvaluateAnswerResponseDto>> evaluateAnswer({
    required CandidateDto candidate,
    required String roleSummary,
    required InterviewQuestion question,
    required String answer,
    required AnswerInputMode inputMode,
    int? durationSeconds,
    int? fillerWordCount,
    CancelHandle? cancel,
  }) {
    return _api.post(
      'evaluate-answer',
      {
        ...candidate.toJson(),
        'roleSummary': roleSummary,
        'question': {
          'text': question.text,
          'type': question.type.name,
          'focus': question.focus,
        },
        'answer': answer,
        'inputMode': inputMode.name,
        'durationSeconds': ?durationSeconds,
        'fillerWordCount': ?fillerWordCount,
      },
      parse: AnswerFeedback.fromJson,
      cancel: cancel,
    );
  }
}

@Riverpod(keepAlive: true)
AiService aiService(Ref ref) => AiService(ref.watch(apiClientProvider));
