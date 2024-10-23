import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:streaker/core/routing.dart';
import 'package:streaker/core/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait<void>([
    setupDi(),
  ]);

  if (kReleaseMode) {
    SentryFlutter.init(
      (options) {
        options.dsn = String.fromEnvironment('SENTRY_DSN');
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(
        ProviderScope(
          child: const App(),
        ),
      ),
    );
  } else {
    runApp(
      ProviderScope(
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Streaker',
      routerConfig: Routing.router,
    );
  }
}
