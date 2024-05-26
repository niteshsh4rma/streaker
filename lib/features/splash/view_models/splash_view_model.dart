import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/core/services/auth_service.dart';
import 'package:streaker/core/services/db_service.dart';

part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  FutureOr<Routes> build() async {
    final route = await _getRoute();
    if (route == Routes.home) {}
    return route;
  }

  Future<Routes> _getRoute() async {
    return AuthService.user != null
        ? await DbService.isOnboarded()
            ? Routes.home
            : Routes.onboarding
        : Routes.auth;
  }
}
