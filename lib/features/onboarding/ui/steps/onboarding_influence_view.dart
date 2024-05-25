import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:streaker/features/onboarding/models/influence.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:streaker/features/onboarding/widgets/option_tile.dart';

class OnboardingInfluenceView extends ConsumerWidget {
  const OnboardingInfluenceView({super.key});

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
                  text: 'What influenced you to become ',
                ),
                TextSpan(
                  text: 'organized',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '? 🧘',
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
              'Understanding your motivations helps us align Streaker with your goals. Select all that apply.',
              textAlign: TextAlign.center,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => OptionTile.multiple(
              isSelected: ref
                  .watch(onboardingViewModelProvider)
                  .influences
                  .contains(Influence.values[index]),
              title: Influence.values[index].displayName,
              emoji: Influence.values[index].emoji,
              onTap: () => ref
                  .read(onboardingViewModelProvider.notifier)
                  .toggleInfluence(Influence.values[index]),
            ),
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: Influence.values.length,
          ),
        ],
      ),
    );
  }
}
