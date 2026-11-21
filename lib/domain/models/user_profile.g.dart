// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  name: json['name'] as String? ?? '',
  targetRole: json['target_role'] as String? ?? '',
  seniority:
      $enumDecodeNullable(_$SeniorityEnumMap, json['seniority']) ??
      Seniority.junior,
  interviewLanguage:
      $enumDecodeNullable(
        _$InterviewLanguageEnumMap,
        json['interview_language'],
      ) ??
      InterviewLanguage.tr,
  struggle:
      $enumDecodeNullable(_$StruggleEnumMap, json['struggle']) ??
      Struggle.technical,
  interviewTiming:
      $enumDecodeNullable(_$InterviewTimingEnumMap, json['interview_timing']) ??
      InterviewTiming.notScheduled,
);

Map<String, dynamic> _$UserProfileToJson(
  _UserProfile instance,
) => <String, dynamic>{
  'name': instance.name,
  'target_role': instance.targetRole,
  'seniority': _$SeniorityEnumMap[instance.seniority]!,
  'interview_language': _$InterviewLanguageEnumMap[instance.interviewLanguage]!,
  'struggle': _$StruggleEnumMap[instance.struggle]!,
  'interview_timing': _$InterviewTimingEnumMap[instance.interviewTiming]!,
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

const _$StruggleEnumMap = {
  Struggle.selfIntro: 'selfIntro',
  Struggle.technical: 'technical',
  Struggle.behavioral: 'behavioral',
  Struggle.nerves: 'nerves',
};

const _$InterviewTimingEnumMap = {
  InterviewTiming.thisWeek: 'thisWeek',
  InterviewTiming.thisMonth: 'thisMonth',
  InterviewTiming.notScheduled: 'notScheduled',
};
