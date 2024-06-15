// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaker/core/utils.dart';

part 'preferences_view_model.g.dart';
part 'preferences_view_model.freezed.dart';

@Riverpod(keepAlive: true)
class PreferencesViewModel extends _$PreferencesViewModel {
  @override
  PreferencesState build() {
    return PreferencesState();
  }

  bool setMorningTime(TimeOfDay morning) {
    if (toDouble(morning) >= toDouble(state.afternoon)) return false;
    state = state.copyWith(
      morning: morning,
    );
    return true;
  }

  bool setAfternoonTime(TimeOfDay afternoon) {
    if (toDouble(afternoon) <= toDouble(state.morning) ||
        toDouble(afternoon) >= toDouble(state.evening)) return false;
    state = state.copyWith(
      afternoon: afternoon,
    );
    return true;
  }

  bool setEveningTime(TimeOfDay evening) {
    if (toDouble(evening) <= toDouble(state.afternoon)) return false;
    state = state.copyWith(
      evening: evening,
    );
    return true;
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
}

@freezed
class PreferencesState with _$PreferencesState {
  factory PreferencesState({
    @Default(TimeOfDay(hour: 5, minute: 0))
    @JsonKey(
      fromJson: timeOfDayfromJson,
      toJson: timeOfDaytoJson,
    )
    TimeOfDay morning,
    @Default(TimeOfDay(hour: 12, minute: 0))
    @JsonKey(
      fromJson: timeOfDayfromJson,
      toJson: timeOfDaytoJson,
    )
    TimeOfDay afternoon,
    @Default(TimeOfDay(hour: 18, minute: 0))
    @JsonKey(
      fromJson: timeOfDayfromJson,
      toJson: timeOfDaytoJson,
    )
    TimeOfDay evening,
  }) = _PreferencesState;

  factory PreferencesState.fromJson(Map<String, Object?> json) =>
      _$PreferencesStateFromJson(json);
}
