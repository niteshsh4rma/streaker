import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:streaker/gen/assets.gen.dart';

class Logo extends StatelessWidget {
  final Size size;
  final void Function(AnimationController)? onComplete;
  final bool repeat;

  const Logo({
    super.key,
    required this.size,
    this.onComplete,
    this.repeat = true,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logoHeroAnimation',
      child: RepaintBoundary(
        child: Assets.images.logo
            .image(width: size.width, height: size.height)
            .animate(
          effects: [
            const RotateEffect(
              duration: Duration(seconds: 3),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              begin: 0,
              end: 1,
            ),
          ],
          autoPlay: true,
          onComplete: onComplete,
          onPlay: (controller) => repeat ? controller.repeat() : null,
        ),
      ),
    );
  }
}
