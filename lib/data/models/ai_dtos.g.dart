// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CandidateDto _$CandidateDtoFromJson(Map<String, dynamic> json) =>
    _CandidateDto(
      role: json['role'] as String,
      seniority: json['seniority'] as String,
      language: json['language'] as String,
      struggle: json['struggle'] as String,
    );

Map<String, dynamic> _$CandidateDtoToJson(_CandidateDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      'seniority': instance.seniority,
      'language': instance.language,
      'struggle': instance.struggle,
    };

_GeneratedQuestionDto _$GeneratedQuestionDtoFromJson(
  Map<String, dynamic> json,
) => _GeneratedQuestionDto(
  text: json['text'] as String,
  type: json['type'] as String,
  focus: json['focus'] as String? ?? '',
);

Map<String, dynamic> _$GeneratedQuestionDtoToJson(
  _GeneratedQuestionDto instance,
) => <String, dynamic>{
  'text': instance.text,
  'type': instance.type,
  'focus': instance.focus,
};

_GenerateQuestionsResponseDto _$GenerateQuestionsResponseDtoFromJson(
  Map<String, dynamic> json,
) => _GenerateQuestionsResponseDto(
  roleSummary: json['roleSummary'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => GeneratedQuestionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GenerateQuestionsResponseDtoToJson(
  _GenerateQuestionsResponseDto instance,
) => <String, dynamic>{
  'roleSummary': instance.roleSummary,
  'questions': instance.questions.map((e) => e.toJson()).toList(),
};
