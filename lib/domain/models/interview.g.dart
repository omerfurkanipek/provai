// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterviewQuestion _$InterviewQuestionFromJson(Map<String, dynamic> json) =>
    _InterviewQuestion(
      id: json['id'] as String,
      text: json['text'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      focus: json['focus'] as String? ?? '',
    );

Map<String, dynamic> _$InterviewQuestionToJson(_InterviewQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'focus': instance.focus,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.motivation: 'motivation',
  QuestionType.behavioral: 'behavioral',
  QuestionType.technical: 'technical',
  QuestionType.situational: 'situational',
};

_CriteriaScores _$CriteriaScoresFromJson(Map<String, dynamic> json) =>
    _CriteriaScores(
      structure: (json['structure'] as num).toInt(),
      relevance: (json['relevance'] as num).toInt(),
      specificity: (json['specificity'] as num).toInt(),
      clarity: (json['clarity'] as num).toInt(),
    );

Map<String, dynamic> _$CriteriaScoresToJson(_CriteriaScores instance) =>
    <String, dynamic>{
      'structure': instance.structure,
      'relevance': instance.relevance,
      'specificity': instance.specificity,
      'clarity': instance.clarity,
    };

_Improvement _$ImprovementFromJson(Map<String, dynamic> json) => _Improvement(
  fix: json['fix'] as String,
  quote: json['quote'] as String? ?? '',
);

Map<String, dynamic> _$ImprovementToJson(_Improvement instance) =>
    <String, dynamic>{'fix': instance.fix, 'quote': instance.quote};

_AnswerFeedback _$AnswerFeedbackFromJson(Map<String, dynamic> json) =>
    _AnswerFeedback(
      score: (json['score'] as num).toInt(),
      criteria: CriteriaScores.fromJson(
        json['criteria'] as Map<String, dynamic>,
      ),
      summary: json['summary'] as String,
      strengths: (json['strengths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      improvements: (json['improvements'] as List<dynamic>)
          .map((e) => Improvement.fromJson(e as Map<String, dynamic>))
          .toList(),
      improvedAnswer: json['improvedAnswer'] as String,
      followUpQuestion: json['followUpQuestion'] as String,
    );

Map<String, dynamic> _$AnswerFeedbackToJson(_AnswerFeedback instance) =>
    <String, dynamic>{
      'score': instance.score,
      'criteria': instance.criteria.toJson(),
      'summary': instance.summary,
      'strengths': instance.strengths,
      'improvements': instance.improvements.map((e) => e.toJson()).toList(),
      'improvedAnswer': instance.improvedAnswer,
      'followUpQuestion': instance.followUpQuestion,
    };

_InterviewAnswer _$InterviewAnswerFromJson(Map<String, dynamic> json) =>
    _InterviewAnswer(
      questionId: json['questionId'] as String,
      transcript: json['transcript'] as String,
      inputMode: $enumDecode(_$AnswerInputModeEnumMap, json['inputMode']),
      feedback: AnswerFeedback.fromJson(
        json['feedback'] as Map<String, dynamic>,
      ),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      fillerWordCount: (json['fillerWordCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InterviewAnswerToJson(_InterviewAnswer instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'transcript': instance.transcript,
      'inputMode': _$AnswerInputModeEnumMap[instance.inputMode]!,
      'feedback': instance.feedback.toJson(),
      'durationSeconds': instance.durationSeconds,
      'fillerWordCount': instance.fillerWordCount,
    };

const _$AnswerInputModeEnumMap = {
  AnswerInputMode.voice: 'voice',
  AnswerInputMode.text: 'text',
};

_InterviewSession _$InterviewSessionFromJson(Map<String, dynamic> json) =>
    _InterviewSession(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      targetRole: json['targetRole'] as String,
      seniority: $enumDecode(_$SeniorityEnumMap, json['seniority']),
      language: $enumDecode(_$InterviewLanguageEnumMap, json['language']),
      roleSummary: json['roleSummary'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => InterviewQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobPosting: json['jobPosting'] as String? ?? '',
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((e) => InterviewAnswer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InterviewSessionToJson(_InterviewSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'targetRole': instance.targetRole,
      'seniority': _$SeniorityEnumMap[instance.seniority]!,
      'language': _$InterviewLanguageEnumMap[instance.language]!,
      'roleSummary': instance.roleSummary,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'jobPosting': instance.jobPosting,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

const _$SeniorityEnumMap = {
  Seniority.intern: 'intern',
  Seniority.junior: 'junior',
  Seniority.mid: 'mid',
  Seniority.senior: 'senior',
};

const _$InterviewLanguageEnumMap = {
  InterviewLanguage.tr: 'tr',
  InterviewLanguage.en: 'en',
};
