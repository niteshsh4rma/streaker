// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      type: $enumDecode(_$HabitTypeEnumMap, json['type']),
      name: json['name'] as String,
      emoji: emojiFromJson(json['emoji'] as Map<String, dynamic>?),
      color: json['color'] == null
          ? Colors.blue
          : colorFromJson((json['color'] as num).toInt()),
      when: DateTime.parse(json['when'] as String),
      frequency: $enumDecodeNullable(_$FrequencyEnumMap, json['frequency']) ??
          Frequency.daily,
      time: $enumDecodeNullable(_$TimeEnumMap, json['time']) ?? Time.morning,
      dailyFrequency: (json['dailyFrequency'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DayEnumMap, e))
              .toSet() ??
          const {},
      weeklyFrequency: (json['weeklyFrequency'] as num?)?.toInt() ?? 1,
      monthlyFrequency: (json['monthlyFrequency'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toSet() ??
          const {},
      reminderTime: timeOfDayfromJsonNullable(json['reminderTime'] as String?),
      endsOn: json['endsOn'] == null
          ? null
          : DateTime.parse(json['endsOn'] as String),
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'type': _$HabitTypeEnumMap[instance.type]!,
      'name': instance.name,
      'emoji': emojiToJson(instance.emoji),
      'color': colorToJson(instance.color),
      'when': instance.when.toIso8601String(),
      'frequency': _$FrequencyEnumMap[instance.frequency]!,
      'time': _$TimeEnumMap[instance.time]!,
      'dailyFrequency':
          instance.dailyFrequency.map((e) => _$DayEnumMap[e]!).toList(),
      'weeklyFrequency': instance.weeklyFrequency,
      'monthlyFrequency': instance.monthlyFrequency.toList(),
      'reminderTime': timeOfDaytoJsonNullable(instance.reminderTime),
      'endsOn': instance.endsOn?.toIso8601String(),
    };

const _$HabitTypeEnumMap = {
  HabitType.regular: 'regular',
  HabitType.onetime: 'onetime',
};

const _$FrequencyEnumMap = {
  Frequency.daily: 'daily',
  Frequency.weekly: 'weekly',
  Frequency.monthly: 'monthly',
};

const _$TimeEnumMap = {
  Time.morning: 'morning',
  Time.afternoon: 'afternoon',
  Time.evening: 'evening',
};

const _$DayEnumMap = {
  Day.sunday: 'sunday',
  Day.monday: 'monday',
  Day.tuesday: 'tuesday',
  Day.wednesday: 'wednesday',
  Day.thursday: 'thursday',
  Day.friday: 'friday',
  Day.saturday: 'saturday',
};
