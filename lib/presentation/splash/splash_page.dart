import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:streaker/presentation/splash/splash_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashAsyncValue = ref.watch(splashNotifierProvider);

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      child: Stack(
        children: [
          Center(
            child: Icon(
              HugeIcons.strokeRoundedAtomicPower,
              size: 128,
            ),
          ),
          Center(
            child: Text(dotenv.env.toString()),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 200,
              padding: const EdgeInsets.only(top: 200),
              child: splashAsyncValue.isLoading
                  ? LinearProgressIndicator()
                  : splashAsyncValue.hasError
                      ? FilledButton(
                          onPressed: () {
                            ref.read(splashNotifierProvider.notifier).retry();
                          },
                          child: Text('Retry'),
                        )
                      : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
