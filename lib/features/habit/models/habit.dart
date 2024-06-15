// ignore_for_file: invalid_annotation_target

import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:streaker/core/utils.dart';
import 'package:streaker/features/habit/models/day.dart';
import 'package:rrule/rrule.dart' as rrule;

part 'habit.freezed.dart';
part 'habit.g.dart';

enum HabitType {
  regular,
  onetime,
}

enum Time {
  morning,
  afternoon,
  evening,
}

enum Frequency {
  daily,
  weekly,
  monthly,
}

extension FrequencyExtension on Frequency {
  rrule.Frequency toRecurrenceFrequency() {
    switch (this) {
      case Frequency.daily:
        return rrule.Frequency.daily;
      case Frequency.monthly:
        return rrule.Frequency.monthly;
      case Frequency.weekly:
        return rrule.Frequency.weekly;
    }
  }
}

@freezed
class Habit with _$Habit {
  const factory Habit({
    required HabitType type,
    required String name,
    @JsonKey(
      fromJson: emojiFromJson,
      toJson: emojiToJson,
    )
    required AnimatedEmojiData? emoji,
    @JsonKey(
      fromJson: colorFromJson,
      toJson: colorToJson,
    )
    @Default(Colors.blue)
    Color color,
    required DateTime when,
    @Default(Frequency.daily) Frequency frequency,
    @Default(Time.morning) Time time,
    @Default({}) Set<Day> dailyFrequency,
    @Default(1) int weeklyFrequency,
    @Default({}) Set<int> monthlyFrequency,
    @JsonKey(
      fromJson: timeOfDayfromJsonNullable,
      toJson: timeOfDaytoJsonNullable,
    )
    TimeOfDay? reminderTime,
    DateTime? endsOn,
    @JsonKey(
      includeFromJson: false,
      includeIfNull: false,
      includeToJson: false,
    )
    @Default(false)
    bool isLoading,
  }) = _Habit;

  factory Habit.fromJson(Map<String, Object?> json) => _$HabitFromJson(json);
}

extension HabitExtension on Habit {
  rrule.RecurrenceRule? get recurrenceRule {
    rrule.RecurrenceRule? rule;

    if (type == HabitType.regular) {
      rule = rrule.RecurrenceRule(
        frequency: frequency.toRecurrenceFrequency(),
        until: endsOn,
      );

      if (frequency == Frequency.daily) {
        rule = rule.copyWith(
          byWeekDays:
              dailyFrequency.map((e) => rrule.ByWeekDayEntry(e.index)).toList(),
        );
      } else if (frequency == Frequency.weekly) {
        rule = rule.copyWith(
          interval: weeklyFrequency,
        );
      } else if (frequency == Frequency.monthly) {
        rule = rule.copyWith(
          byMonthDays: monthlyFrequency.toList(),
        );
      }
    }

    return rule;
  }
}
