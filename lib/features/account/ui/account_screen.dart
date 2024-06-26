import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/core/services/modal_service.dart';
import 'package:streaker/features/account/widgets/log_out_sheet.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Preferences'),
                  leading: const Icon(Iconsax.setting),
                  trailing: const Icon(CupertinoIcons.right_chevron),
                  onTap: () => context.pushNamed(Routes.preferences.name),
                ),
                const ListTile(
                  title: Text('Help & Support'),
                  leading: Icon(Iconsax.document),
                  trailing: Icon(CupertinoIcons.right_chevron),
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  onTap: () async {
                    final isLoggedOut = await ModalService.showModal<bool>(
                      context,
                      (context) => const LogOutSheet(),
                    );

                    await Future.delayed(const Duration(milliseconds: 200));

                    if (isLoggedOut == true) {
                      // ignore: use_build_context_synchronously
                      context.pushReplacementNamed(Routes.root.name);
                    }
                  },
                  leading: Icon(
                    Iconsax.logout,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Iconsax.profile_delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  title: Text(
                    'Delete account',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'Streaker v0.0.1',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          Text(
            'Developed with ❤️ by niteshsh4rma',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
