import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/core/services/auth_service.dart';
import 'package:streaker/core/services/db_service.dart';

part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  FutureOr<Routes> build() async => _getRoute();

  Future<Routes> _getRoute() async {
    return AuthService.user != null
        ? await DbService.isOnboarded()
            ? Routes.dashboard
            : Routes.onboarding
        : Routes.auth;
  }
}
