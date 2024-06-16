// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaker/core/services/db_service.dart';
import 'package:streaker/features/habit/models/day.dart';
import 'package:streaker/features/habit/models/habit.dart';
import 'package:streaker/features/habit/view_models/all_habits_view_model.dart';

part 'add_habit_view_model.g.dart';

@riverpod
class AddHabitViewModel extends _$AddHabitViewModel {
  // ignore: avoid_public_notifier_properties
  TextEditingController nameController = TextEditingController();
  @override
  Habit build() {
    nameController = TextEditingController();

    ref.onDispose(() {
      nameController.dispose();
    });

    return Habit(
      type: HabitType.regular,
      name: '',
      emoji: null,
      dailyFrequency: {
        Day.values[DateTime.now().weekday % 7]
      },
      when: DateTime.now(),
    );
  }

  void setHabit(HabitType type) {
    if (state.isLoading) return;

    state = state.copyWith(
      type: type,
    );
  }

  bool isValid() {
    if (nameController.text.trim().isEmpty) {
      return false;
    }

    if (state.emoji == null) {
      return false;
    }

    if (state.frequency == Frequency.daily && state.dailyFrequency.isEmpty) {
      return false;
    }

    return true;
  }

  void setName(String name) {
    if (state.isLoading) return;

    state = state.copyWith(
      name: name,
    );
  }

  void setEmoji(AnimatedEmojiData emoji) {
    if (state.isLoading) return;

    state = state.copyWith(
      emoji: emoji,
    );
  }

  void setWhen(DateTime when) {
    if (state.isLoading) return;

    state = state.copyWith(
      when: when,
    );
  }

  void setColor(Color color) {
    if (state.isLoading) return;

    state = state.copyWith(
      color: color,
    );
  }

  void setFrequency(Frequency frequency) {
    if (state.isLoading) return;

    state = state.copyWith(
      frequency: frequency,
    );
  }

  void toggleDailyFrequency(Day frequency) {
    if (state.isLoading) return;

    Set<Day> frequencies = Set.from(state.dailyFrequency);
    if (frequencies.contains(frequency)) {
      frequencies.remove(frequency);
    } else {
      frequencies.add(frequency);
    }
    state = state.copyWith(
      dailyFrequency: frequencies,
    );
  }

  void toggleMonthlyFrequency(int frequency) {
    if (state.isLoading) return;

    Set<int> frequencies = Set.from(state.monthlyFrequency);
    if (frequencies.contains(frequency)) {
      frequencies.remove(frequency);
    } else {
      frequencies.add(frequency);
    }
    state = state.copyWith(
      monthlyFrequency: frequencies,
    );
  }

  void setWeeklyFrequency(int frequency) {
    if (state.isLoading) return;

    state = state.copyWith(
      weeklyFrequency: frequency,
    );
  }

  void setTime(Time time) {
    if (state.isLoading) return;

    state = state.copyWith(
      time: time,
    );
  }

  void setEndsOn(DateTime? date) {
    if (state.isLoading) return;

    state = state.copyWith(
      endsOn: date,
    );
  }

  void setReminder(TimeOfDay? time) {
    if (state.isLoading) return;

    state = state.copyWith(
      reminderTime: time,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<bool> onSave() async {
    setLoading(true);
    try {
      final id = await DbService.addHabit(state);
      if (id != null) {
        ref.read(allHabitsViewModelProvider.notifier).add(
              id: id,
              habit: state,
            );
      }
      setLoading(id != null);
      return id != null;
    } catch (error) {
      setLoading(false);
      return false;
    }
  }
}
