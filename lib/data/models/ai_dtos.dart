import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/interview.dart';

part 'ai_dtos.freezed.dart';
part 'ai_dtos.g.dart';

// Edge Function sözleşmesi (supabase/functions/*). Alan adları sunucuyla birebir.

@freezed
abstract class CandidateDto with _$CandidateDto {
  const factory CandidateDto({
    required String role,
    required String seniority,
    required String language,
    required String struggle,
  }) = _CandidateDto;

  factory CandidateDto.fromJson(Map<String, dynamic> json) =>
      _$CandidateDtoFromJson(json);
}

@freezed
abstract class GeneratedQuestionDto with _$GeneratedQuestionDto {
  const factory GeneratedQuestionDto({
    required String text,
    required String type,
    @Default('') String focus,
  }) = _GeneratedQuestionDto;

  factory GeneratedQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$GeneratedQuestionDtoFromJson(json);
}

@freezed
abstract class GenerateQuestionsResponseDto
    with _$GenerateQuestionsResponseDto {
  const factory GenerateQuestionsResponseDto({
    required String roleSummary,
    required List<GeneratedQuestionDto> questions,
  }) = _GenerateQuestionsResponseDto;

  factory GenerateQuestionsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GenerateQuestionsResponseDtoFromJson(json);
}

/// Değerlendirme yanıtı domain modeliyle aynı yapıda; doğrudan onu kullanır.
typedef EvaluateAnswerResponseDto = AnswerFeedback;

extension GeneratedQuestionMapping on GeneratedQuestionDto {
  InterviewQuestion toDomain(String id) => InterviewQuestion(
    id: id,
    text: text,
    focus: focus,
    // Bilinmeyen tip gelirse güvenli varsayılan.
    type: QuestionType.values.asNameMap()[type] ?? QuestionType.situational,
  );
}
