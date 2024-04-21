import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaker/features/dashboard/view_models/dashboard_view_model.dart';
import 'package:streaker/features/splash/ui/logo.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dashboardViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Logo(
          size: Size.square(35),
        ),
      ),
      body: Center(
        child: Text(viewModel.counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.incrementCounter(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
