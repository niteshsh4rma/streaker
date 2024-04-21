import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/features/splash/ui/logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const Logo(size: Size.square(100)),
            const Gap(16),
            Text(
              'Let\'s get started!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(16),
            Text(
              'Let\'s dive in into your account',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            GoogleAuthButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
                // ignore: use_build_context_synchronously
                context.pushReplacementNamed(Routes.root.name);
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Add Privacy Policy and Terms of Service
                TextButton(
                  onPressed: () {},
                  child: const Text('Privacy Policy'),
                ),
                const Gap(8),
                const Text('|'),
                const Gap(8),
                TextButton(
                  onPressed: () {},
                  child: const Text('Terms of Service'),
                ),
              ],
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
