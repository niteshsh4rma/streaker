import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/gen/assets.gen.dart';
import 'package:streaker/gen/colors.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: UnconstrainedBox(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 2,
                  width: MediaQuery.sizeOf(context).height * 2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorName.primary,
                  ),
                ).animate().scale(
                      duration: const Duration(milliseconds: 7500),
                      curve: Curves.bounceOut,
                    ),
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: 'logoHeroAnimation',
              child: Assets.images.logo.image(width: 150, height: 150).animate(
                effects: [
                  const RotateEffect(
                    duration: Duration(seconds: 7, milliseconds: 500),
                    curve: Curves.linear,
                    alignment: Alignment.center,
                    begin: 0,
                    end: 1,
                  ),
                ],
                autoPlay: true,
                onComplete: (controller) =>
                    context.pushNamed(Routes.dashboard.name),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
