// ignore_for_file: avoid_public_notifier_properties, invalid_annotation_target
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signature/signature.dart';
import 'package:streaker/core/services/db_service.dart';
import 'package:streaker/features/onboarding/models/focus_issue.dart';
import 'package:streaker/features/onboarding/models/goal.dart';
import 'package:streaker/features/onboarding/models/influence.dart';
import 'package:streaker/features/onboarding/models/onboarding_steps.dart';
import 'package:streaker/features/onboarding/models/procrastinate.dart';
import 'package:streaker/features/onboarding/models/sleep.dart';
import 'package:streaker/gen/colors.gen.dart';

part 'onboarding_view_model.g.dart';
part 'onboarding_view_model.freezed.dart';

@riverpod
class OnboardingViewModel extends _$OnboardingViewModel {
  late PageController _pageController;
  late SignatureController _signatureController;

  PageController get pageController => _pageController;
  SignatureController get signatureController => _signatureController;

  bool get isFirst => state.currentPage == 0;
  bool get isLast => state.currentPage == OnboardingSteps.values.length - 1;

  @override
  OnboardingState build() {
    _pageController = PageController();
    _signatureController = SignatureController(
      penColor: ColorName.primary,
      onDrawEnd: () => setContractSigned(true),
    );
    return OnboardingState();
  }

  void previousPage() {
    if (!isFirst) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Returns true if onboarding is completed
  Future<bool> nextPage() async {
    if (!isLast) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return false;
    } else {
      setLoading(true);
      return DbService.completeOnboarding(state).then((_) => true).catchError(
        (_) {
          log(_.toString());
          setLoading(false);
          return false;
        },
      );
    }
  }

  void setSleep(Sleep sleep) {
    state = state.copyWith(sleep: sleep);
  }

  void setWakeUpTime(DateTime time) {
    state = state.copyWith(wakeUpTime: time);
  }

  void setBedTime(DateTime time) {
    state = state.copyWith(bedTime: time);
  }

  void setProcrastinate(Procrastinate procrastinate) {
    state = state.copyWith(procrastinate: procrastinate);
  }

  void setFocusIssue(FocusIssue focusIssue) {
    state = state.copyWith(focusIssue: focusIssue);
  }

  void toggleInfluence(Influence influence) {
    final influences = List<Influence>.from(state.influences);
    if (influences.contains(influence)) {
      influences.remove(influence);
    } else {
      influences.add(influence);
    }
    state = state.copyWith(influences: influences);
  }

  void toggleGoal(Goal goal) {
    final goals = List<Goal>.from(state.goals);
    if (goals.contains(goal)) {
      goals.remove(goal);
    } else {
      goals.add(goal);
    }
    state = state.copyWith(goals: goals);
  }

  void setContractSigned(bool signed) {
    state = state.copyWith(
      contractSigned: signed,
    );
  }

  void setLoading(bool loading) {
    state = state.copyWith(
      isLoading: loading,
    );
  }

  bool canContinue() {
    if (state.isLoading) return false;

    final step = OnboardingSteps.values[state.currentPage];
    switch (step) {
      case OnboardingSteps.sleepingHours:
        return state.sleep != null;
      case OnboardingSteps.wakeUpTime:
        return state.wakeUpTime != null;
      case OnboardingSteps.bedTime:
        return state.bedTime != null;
      case OnboardingSteps.procrastinate:
        return state.procrastinate != null;
      case OnboardingSteps.focus:
        return state.focusIssue != null;
      case OnboardingSteps.influence:
        return state.influences.isNotEmpty;
      case OnboardingSteps.goals:
        return state.goals.isNotEmpty;
      case OnboardingSteps.contract:
        return state.contractSigned;
    }
  }
}

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    @Default(false)
    bool isLoading,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    @Default(0)
    int currentPage,
    Sleep? sleep,
    DateTime? wakeUpTime,
    DateTime? bedTime,
    Procrastinate? procrastinate,
    FocusIssue? focusIssue,
    @Default([]) List<Influence> influences,
    @Default([]) List<Goal> goals,
    @Default(false) bool contractSigned,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, Object?> json) =>
      _$OnboardingStateFromJson(json);
}
