import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/features/habit/view_models/all_habits_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allHabits = ref.watch(allHabitsViewModelProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Weekly',
                ),
                Tab(
                  text: 'Overall',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Text('All'),
                  Text('Weekly'),
                  Text('Overall'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushNamed(Routes.addHabit.name),
          child: const Icon(Iconsax.add),
        ),
      ),
    );
  }
}
