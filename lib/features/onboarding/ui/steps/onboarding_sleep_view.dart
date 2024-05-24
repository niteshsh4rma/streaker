import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:streaker/features/onboarding/models/sleep.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:streaker/features/onboarding/widgets/option_tile.dart';

class OnboardingSleepView extends ConsumerWidget {
  const OnboardingSleepView({super.key});

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
                  text: 'How long do you usually ',
                ),
                TextSpan(
                  text: 'Sleep',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: ' at night? 😴',
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
              'Understanding your sleep patterns helps us tailor your habit tracking experience.',
              textAlign: TextAlign.center,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => OptionTile.single(
              isSelected: ref.watch(onboardingViewModelProvider).sleep ==
                  Sleep.values[index],
              title: Sleep.values[index].displayName,
              emoji: Sleep.values[index].emoji,
              onTap: () => ref
                  .read(onboardingViewModelProvider.notifier)
                  .setSleep(Sleep.values[index]),
            ),
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: Sleep.values.length,
          ),
        ],
      ),
    );
  }
}
