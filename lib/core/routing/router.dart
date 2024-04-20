import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/features/dashboard/ui/dashboard_screen.dart';
import 'package:streaker/features/splash/ui/splash_screen.dart';

part 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.root.path,
  routes: [
    GoRoute(
      path: Routes.root.path,
      name: Routes.root.name,
      pageBuilder: (context, state) => const CustomPage(
        child: SplashScreen(),
      ),
      routes: [
        GoRoute(
          path: Routes.dashboard.path,
          name: Routes.dashboard.name,
          pageBuilder: (context, state) => const CustomPage(
            child: DashboardScreen(),
          ),
        ),
      ],
    ),
  ],
);

class CustomPage<T> extends Page<T> {
  final Widget child;

  const CustomPage({
    required this.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => _CustomRouteBuilder(
        child: child,
        settings: this,
      );
}

class _CustomRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget child;

  _CustomRouteBuilder({
    required this.child,
    super.settings,
  }) : super(
          opaque: false,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
        );
}
