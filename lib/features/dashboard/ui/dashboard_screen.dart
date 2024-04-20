import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaker/features/dashboard/view_models/dashboard_view_model.dart';
import 'package:streaker/gen/assets.gen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dashboardViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Hero(
          tag: 'logoHeroAnimation',
          child: Assets.images.logo.image(width: 50, height: 50).animate(
            effects: [
              const RotateEffect(
                duration: Duration(seconds: 10),
                curve: Curves.linear,
                alignment: Alignment.center,
                begin: 0,
                end: 1,
              ),
            ],
            onPlay: (controller) => controller.repeat(),
            autoPlay: true,
          ),
        ),
      ),
      body: Center(
        child: Text(viewModel.counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
