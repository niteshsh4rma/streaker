import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signature/signature.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';

class OnboardingConsentView extends ConsumerWidget {
  const OnboardingConsentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingVM = ref.read(onboardingViewModelProvider.notifier);
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
                  text: 'Let\'s make a ',
                ),
                TextSpan(
                  text: 'contract',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '✍️',
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
              'Review & sign your personalized commitment to achieve your goals with Streaker.',
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '''
• I commit to tracking my habits daily 📅
• I promise to prioritize my well-being 🧘
• I will strive for consistency and progress 🌟
• I understand that change take time and effort 💪
''',
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Signature(
                      controller: onboardingVM.signatureController,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton.small(
                      onPressed: () {
                        onboardingVM.signatureController.clear();
                        onboardingVM.setContractSigned(false);
                      },
                      child: const Icon(Icons.clear),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
