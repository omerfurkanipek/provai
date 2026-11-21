// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  name: json['name'] as String? ?? '',
  targetRole: json['targetRole'] as String? ?? '',
  seniority:
      $enumDecodeNullable(_$SeniorityEnumMap, json['seniority']) ??
      Seniority.junior,
  interviewLanguage:
      $enumDecodeNullable(
        _$InterviewLanguageEnumMap,
        json['interviewLanguage'],
      ) ??
      InterviewLanguage.tr,
  struggle:
      $enumDecodeNullable(_$StruggleEnumMap, json['struggle']) ??
      Struggle.technical,
  interviewTiming:
      $enumDecodeNullable(_$InterviewTimingEnumMap, json['interviewTiming']) ??
      InterviewTiming.notScheduled,
);

Map<String, dynamic> _$UserProfileToJson(
  _UserProfile instance,
) => <String, dynamic>{
  'name': instance.name,
  'targetRole': instance.targetRole,
  'seniority': _$SeniorityEnumMap[instance.seniority]!,
  'interviewLanguage': _$InterviewLanguageEnumMap[instance.interviewLanguage]!,
  'struggle': _$StruggleEnumMap[instance.struggle]!,
  'interviewTiming': _$InterviewTimingEnumMap[instance.interviewTiming]!,
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
