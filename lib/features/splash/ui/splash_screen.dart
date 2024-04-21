import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/features/splash/ui/logo.dart';
import 'package:streaker/features/splash/view_models/splash_view_model.dart';
import 'package:streaker/gen/colors.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double calculateDiagonal() {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return sqrt(pow(height, 2) + pow(width, 2));
  }

  @override
  Widget build(BuildContext context) {
    final diagonalScreenSize = calculateDiagonal();
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Center(
            child: UnconstrainedBox(
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: diagonalScreenSize,
                width: diagonalScreenSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorName.primary,
                ),
              ).animate().scale(
                    duration: const Duration(seconds: 5),
                    curve: Curves.easeInExpo,
                  ),
            ),
          ),
        ),
        Center(
          child: Consumer(
            builder: (context, ref, _) {
              final user = ref.watch(splashViewModelProvider);
              return Logo(
                size: const Size.square(150),
                repeat: false,
                onComplete: (_) => user != null
                    ? context.pushReplacementNamed(Routes.dashboard.name)
                    : context.pushReplacementNamed(Routes.auth.name),
              );
            },
          ),
        ),
      ],
    );
  }
}
