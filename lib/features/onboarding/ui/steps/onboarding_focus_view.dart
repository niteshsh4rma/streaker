import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:streaker/features/onboarding/models/focus_issue.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:streaker/features/onboarding/widgets/option_tile.dart';

class OnboardingFocusView extends ConsumerWidget {
  const OnboardingFocusView({super.key});

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
                  text: 'Do you often find it hard to ',
                ),
                TextSpan(
                  text: 'focus',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '? 🎯',
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
              'Let us know if focus is a struggle for you so we can provide targeted support.',
              textAlign: TextAlign.center,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => OptionTile.single(
              isSelected: ref.watch(onboardingViewModelProvider).focusIssue ==
                  FocusIssue.values[index],
              title: FocusIssue.values[index].displayName,
              emoji: FocusIssue.values[index].emoji,
              onTap: () => ref
                  .read(onboardingViewModelProvider.notifier)
                  .setFocusIssue(FocusIssue.values[index]),
            ),
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: FocusIssue.values.length,
          ),
        ],
      ),
    );
  }
}
