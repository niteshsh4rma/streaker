import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/services/auth_service.dart';

class LogOutSheet extends StatelessWidget {
  const LogOutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Logout',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          const Gap(16),
          const Text('Are you sure you want to log out?'),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pop(false),
                  child: const Text('Cancel'),
                ),
              ),
              const Gap(16),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    AuthService.signOut();
                    context.pop(true);
                  },
                  child: const Text('Yes, Logout'),
                ),
              )
            ],
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
