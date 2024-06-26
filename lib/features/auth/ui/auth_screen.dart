// ignore_for_file: use_build_context_synchronously

import 'package:auth_buttons/auth_buttons.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/core/services/auth_service.dart';
import 'package:streaker/core/services/snackbar_service.dart';
import 'package:streaker/features/splash/ui/logo.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoading = false;

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
              isLoading: isLoading,
              onPressed: () async {
                setState(() => isLoading = true);
                try {
                  await AuthService.signInWithGoogle();
                  context.pushReplacementNamed(Routes.root.name);
                } catch (error) {
                  SnackbarService.showMessage(
                    context,
                    title: 'Error',
                    message: 'An error occurred while signing in',
                    contentType: ContentType.failure,
                  );
                }
                setState(() => isLoading = false);
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
