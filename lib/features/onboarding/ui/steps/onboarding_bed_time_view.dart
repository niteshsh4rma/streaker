import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';

class OnboardingBedTimeView extends ConsumerWidget {
  const OnboardingBedTimeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
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
                  text: 'What time do you usually ',
                ),
                TextSpan(
                  text: 'end your day',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '? 🌙',
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
              'Let us know when you typically end your day to optimize your habit tracking.',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: ref.watch(onboardingViewModelProvider).bedTime,
              onDateTimeChanged:
                  ref.read(onboardingViewModelProvider.notifier).setBedTime,
            ),
          ),
        ],
      ),
    );
  }
}
