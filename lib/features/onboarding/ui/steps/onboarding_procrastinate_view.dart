import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:streaker/features/onboarding/models/procrastinate.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:streaker/features/onboarding/widgets/option_tile.dart';

class OnboardingProcrastinateView extends ConsumerWidget {
  const OnboardingProcrastinateView({super.key});

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
                  text: 'Do you often ',
                ),
                TextSpan(
                  text: 'procrastinate',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '? 👀',
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
              'Understanding your procrastination tendencies helps us tailor strategies to overcome them.',
              textAlign: TextAlign.center,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => OptionTile.single(
              isSelected:
                  ref.watch(onboardingViewModelProvider).procrastinate ==
                      Procrastinate.values[index],
              title: Procrastinate.values[index].displayName,
              emoji: Procrastinate.values[index].emoji,
              onTap: () => ref
                  .read(onboardingViewModelProvider.notifier)
                  .setProcrastinate(Procrastinate.values[index]),
            ),
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: Procrastinate.values.length,
          ),
        ],
      ),
    );
  }
}
