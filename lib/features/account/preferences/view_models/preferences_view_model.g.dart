// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesStateImpl _$$PreferencesStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PreferencesStateImpl(
      morning: json['morning'] == null
          ? const TimeOfDay(hour: 5, minute: 0)
          : timeOfDayfromJson(json['morning'] as String),
      afternoon: json['afternoon'] == null
          ? const TimeOfDay(hour: 12, minute: 0)
          : timeOfDayfromJson(json['afternoon'] as String),
      evening: json['evening'] == null
          ? const TimeOfDay(hour: 18, minute: 0)
          : timeOfDayfromJson(json['evening'] as String),
    );

Map<String, dynamic> _$$PreferencesStateImplToJson(
        _$PreferencesStateImpl instance) =>
    <String, dynamic>{
      'morning': timeOfDaytoJson(instance.morning),
      'afternoon': timeOfDaytoJson(instance.afternoon),
      'evening': timeOfDaytoJson(instance.evening),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferencesViewModelHash() =>
    r'fd0fc303d6052a2b2fa913c6d6b901e3e6a03465';

/// See also [PreferencesViewModel].
@ProviderFor(PreferencesViewModel)
final preferencesViewModelProvider =
    NotifierProvider<PreferencesViewModel, PreferencesState>.internal(
  PreferencesViewModel.new,
  name: r'preferencesViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$preferencesViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PreferencesViewModel = Notifier<PreferencesState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
