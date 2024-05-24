import 'dart:math';
import 'dart:developer' as logger;

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/services/snackbar_service.dart';
import 'package:streaker/features/splash/ui/logo.dart';
import 'package:streaker/features/splash/view_models/splash_view_model.dart';
import 'package:streaker/gen/colors.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double calculateDiagonal(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return sqrt(pow(height, 2) + pow(width, 2));
  }

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diagonalScreenSize = calculateDiagonal(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: UnconstrainedBox(
                clipBehavior: Clip.antiAlias,
                child: Consumer(
                  builder: (
                    BuildContext context,
                    WidgetRef ref,
                    Widget? child,
                  ) {
                    final splashVm = ref.watch(splashViewModelProvider);
                    final route = splashVm.when(
                      data: (route) => route,
                      error: (_, __) {
                        logger.log(__.toString());
                        Future.delayed(
                          Duration.zero,
                          () => SnackbarService.showMessage(
                            context,
                            title: 'Error',
                            message: 'An error occurred while signing in',
                            contentType: ContentType.failure,
                          ),
                        );
                        return null;
                      },
                      loading: () => null,
                    );
                    if (route != null) {
                      controller.forward();
                    }
                    return Container(
                      height: diagonalScreenSize,
                      width: diagonalScreenSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorName.primary,
                      ),
                    )
                        .animate(
                          controller: controller,
                          onComplete: (_) => route != null
                              ? context.pushReplacementNamed(route.name)
                              : null,
                        )
                        .scale(
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeInOutBack,
                        );
                  },
                ),
              ),
            ),
          ),
          const Center(
            child: Logo(
              size: Size.square(150),
            ),
          ),
        ],
      ),
    );
  }
}
