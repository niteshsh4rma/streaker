import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashState {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;

  SplashState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
  });
}

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(SplashState(isLoading: true)) {
    _initialize();
  }

  Future<void> _initialize() async {
    state = SplashState(isLoading: true); // Set loading
    try {
      await Future.delayed(const Duration(seconds: 3)); // Simulate loading
      // Simulate error
      throw Exception('Splash initialization failed');
    } catch (e) {
      state = SplashState(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  void retry() {
    _initialize(); // Retry the initialization
  }
}

final splashNotifierProvider =
    StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(),
);
