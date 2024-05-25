// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaker/core/services/snackbar_service.dart';
import 'package:streaker/features/account/preferences/view_models/preferences_view_model.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferenceState = ref.watch(preferencesViewModelProvider);
    final preferencesVM = ref.read(preferencesViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Morning'),
                    subtitle: Text(
                      'Start at ${preferenceState.morning.format(context)}',
                    ),
                    trailing: const Icon(CupertinoIcons.chevron_right),
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: preferenceState.morning,
                      );

                      if (time != null && !preferencesVM.setMorningTime(time)) {
                        SnackbarService.showMessage(
                          context,
                          title: 'Invalid Time',
                          message: 'Morning time cannot be after Afternoon.',
                          contentType: ContentType.failure,
                        );
                      }
                    },
                  ),
                  ListTile(
                    title: const Text('Afternoon'),
                    subtitle: Text(
                      'Start at ${preferenceState.afternoon.format(context)}',
                    ),
                    trailing: const Icon(CupertinoIcons.chevron_right),
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: preferenceState.afternoon,
                      );

                      if (time != null &&
                          !preferencesVM.setAfternoonTime(time)) {
                        SnackbarService.showMessage(
                          context,
                          title: 'Invalid Time',
                          message:
                              'Afternoon time should be between Morning and Evening.',
                          contentType: ContentType.failure,
                        );
                      }
                    },
                  ),
                  ListTile(
                    title: const Text('Evening'),
                    subtitle: Text(
                      'Start at ${preferenceState.evening.format(context)}',
                    ),
                    trailing: const Icon(CupertinoIcons.chevron_right),
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: preferenceState.evening,
                      );

                      if (time != null && !preferencesVM.setEveningTime(time)) {
                        SnackbarService.showMessage(
                          context,
                          title: 'Invalid Time',
                          message: 'Evening time cannot be before Afternoon',
                          contentType: ContentType.failure,
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
