// ignore_for_file: avoid_public_notifier_properties
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaker/features/dashboard/models/tabs.dart';

part 'dashboard_view_model.g.dart';
part 'dashboard_view_model.freezed.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  DashboardState build() {
    return DashboardState(
      tabIndex: 0,
      title: NavigationTab.values[0].label,
    );
  }

  void setTabIndex(int index) {
    state = state.copyWith(
      tabIndex: index,
      title: NavigationTab.values[index].label,
      actions: actionsMap[NavigationTab.values[index].label] ?? [],
    );
  }

  final Map<String, List<Widget>> actionsMap = {
    NavigationTab.home.label: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    ],
    NavigationTab.moodStat.label: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    ],
    NavigationTab.report.label: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    ],
    NavigationTab.myHabits.label: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    ],
    NavigationTab.account.label: [],
  };
}

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    required int tabIndex,
    required String title,
    @Default([]) List<Widget> actions,
  }) = _DashboardState;
}
