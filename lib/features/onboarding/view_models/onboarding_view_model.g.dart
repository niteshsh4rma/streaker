// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingStateImpl _$$OnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingStateImpl(
      sleep: $enumDecodeNullable(_$SleepEnumMap, json['sleep']),
      wakeUpTime: json['wakeUpTime'] == null
          ? null
          : DateTime.parse(json['wakeUpTime'] as String),
      bedTime: json['bedTime'] == null
          ? null
          : DateTime.parse(json['bedTime'] as String),
      procrastinate:
          $enumDecodeNullable(_$ProcrastinateEnumMap, json['procrastinate']),
      focusIssue: $enumDecodeNullable(_$FocusIssueEnumMap, json['focusIssue']),
      influences: (json['influences'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$InfluenceEnumMap, e))
              .toList() ??
          const [],
      goals: (json['goals'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$GoalEnumMap, e))
              .toList() ??
          const [],
      contractSigned: json['contractSigned'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnboardingStateImplToJson(
        _$OnboardingStateImpl instance) =>
    <String, dynamic>{
      'sleep': _$SleepEnumMap[instance.sleep],
      'wakeUpTime': instance.wakeUpTime?.toIso8601String(),
      'bedTime': instance.bedTime?.toIso8601String(),
      'procrastinate': _$ProcrastinateEnumMap[instance.procrastinate],
      'focusIssue': _$FocusIssueEnumMap[instance.focusIssue],
      'influences':
          instance.influences.map((e) => _$InfluenceEnumMap[e]!).toList(),
      'goals': instance.goals.map((e) => _$GoalEnumMap[e]!).toList(),
      'contractSigned': instance.contractSigned,
    };

const _$SleepEnumMap = {
  Sleep.lessThan6: 'lessThan6',
  Sleep.between6And7: 'between6And7',
  Sleep.between7And8: 'between7And8',
  Sleep.between8And9: 'between8And9',
  Sleep.moreThan9: 'moreThan9',
};

const _$ProcrastinateEnumMap = {
  Procrastinate.always: 'always',
  Procrastinate.sometimes: 'sometimes',
  Procrastinate.rarely: 'rarely',
  Procrastinate.never: 'never',
};

const _$FocusIssueEnumMap = {
  FocusIssue.constantly: 'constantly',
  FocusIssue.occasionally: 'occasionally',
  FocusIssue.rarely: 'rarely',
  FocusIssue.never: 'never',
};

const _$InfluenceEnumMap = {
  Influence.lackOfMotivation: 'lackOfMotivation',
  Influence.workOverload: 'workOverload',
  Influence.clutteredEnvironment: 'clutteredEnvironment',
  Influence.digitalDistractions: 'digitalDistractions',
  Influence.lackOfTimeManagement: 'lackOfTimeManagement',
};

const _$GoalEnumMap = {
  Goal.buildHealthyHabits: 'buildHealthyHabits',
  Goal.boostProductivity: 'boostProductivity',
  Goal.achievePersonalGoals: 'achievePersonalGoals',
  Goal.manageStressAndAnxiety: 'manageStressAndAnxiety',
  Goal.other: 'other',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingViewModelHash() =>
    r'ac3888465b09078fda1a554e65e04e8aceb766a3';

/// See also [OnboardingViewModel].
@ProviderFor(OnboardingViewModel)
final onboardingViewModelProvider =
    AutoDisposeNotifierProvider<OnboardingViewModel, OnboardingState>.internal(
  OnboardingViewModel.new,
  name: r'onboardingViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OnboardingViewModel = AutoDisposeNotifier<OnboardingState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
