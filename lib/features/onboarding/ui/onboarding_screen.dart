import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/features/onboarding/models/onboarding_steps.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_bed_time_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_consent_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_focus_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_goal_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_influence_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_procrastinate_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_sleep_view.dart';
import 'package:streaker/features/onboarding/ui/steps/onboarding_wake_up_view.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingViewModelProvider);
    final onboardingVM = ref.read(onboardingViewModelProvider.notifier);
    final currentPage = onboardingState.currentPage + 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: onboardingVM.isFirst || onboardingState.isLoading
            ? const SizedBox.shrink()
            : BackButton(
                onPressed: onboardingVM.previousPage,
              ),
        title: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: currentPage / OnboardingSteps.values.length,
          ),
          builder: (context, value, _) => LinearProgressIndicator(
            value: value,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '$currentPage/${OnboardingSteps.values.length}',
            ),
          ),
        ],
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: OnboardingSteps.values.length,
        itemBuilder: (context, index) => steps[index],
        controller: onboardingVM.pageController,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: FilledButton(
          onPressed: onboardingVM.canContinue()
              ? () async {
                  final isOnboareded = await onboardingVM.nextPage();
                  if (isOnboareded) {
                    // ignore: use_build_context_synchronously
                    context.pushReplacementNamed(Routes.root.name);
                  }
                }
              : null,
          child: onboardingState.isLoading
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Text(onboardingVM.isLast ? 'Finish' : 'Continue'),
        ),
      ),
    );
  }

  final List<Widget> steps = const [
    OnboardingSleepView(),
    OnboardingWakeUpView(),
    OnboardingBedTimeView(),
    OnboardingProcrastinateView(),
    OnboardingFocusView(),
    OnboardingInfluenceView(),
    OnboardingGoalView(),
    OnboardingConsentView(),
  ];
}
