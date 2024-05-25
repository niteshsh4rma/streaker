import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:streaker/features/onboarding/models/goal.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:streaker/features/onboarding/widgets/option_tile.dart';

class OnboardingGoalView extends ConsumerWidget {
  const OnboardingGoalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                const TextSpan(
                  text: 'What do you want to ',
                ),
                TextSpan(
                  text: 'achieve',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: ' with Streaker? 🎯',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Text(
              'Your aspirations guide our efforts to support and empower you on your journey. Select all that apply.',
              textAlign: TextAlign.center,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => OptionTile.multiple(
              isSelected: ref
                  .watch(onboardingViewModelProvider)
                  .goals
                  .contains(Goal.values[index]),
              title: Goal.values[index].displayName,
              emoji: Goal.values[index].emoji,
              onTap: () => ref
                  .read(onboardingViewModelProvider.notifier)
                  .toggleGoal(Goal.values[index]),
            ),
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: Goal.values.length,
          ),
        ],
      ),
    );
  }
}
