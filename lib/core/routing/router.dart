import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/features/account/ui/account_screen.dart';
import 'package:streaker/features/auth/ui/auth_screen.dart';
import 'package:streaker/features/dashboard/models/tabs.dart';
import 'package:streaker/features/dashboard/ui/dashboard_screen.dart';
import 'package:streaker/features/dashboard/view_models/dashboard_view_model.dart';
import 'package:streaker/features/home/ui/home_screen.dart';
import 'package:streaker/features/mood_stat/ui/mood_stat_screen.dart';
import 'package:streaker/features/my_habits/ui/my_habits_screen.dart';
import 'package:streaker/features/onboarding/ui/onboarding_screen.dart';
import 'package:streaker/features/report/ui/report_screen.dart';
import 'package:streaker/features/splash/ui/splash_screen.dart';

part 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.root.path,
  routes: [
    GoRoute(
      path: Routes.root.path,
      name: Routes.root.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
      routes: [
        GoRoute(
          path: Routes.onboarding.path,
          name: Routes.onboarding.name,
          pageBuilder: (context, state) => CustomPage(
            key: state.pageKey,
            child: const OnboardingScreen(),
          ),
        ),
        GoRoute(
          path: Routes.auth.path,
          name: Routes.auth.name,
          pageBuilder: (context, state) => CustomPage(
            key: state.pageKey,
            child: const AuthScreen(),
          ),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return DashboardScreen(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: Routes.home.path,
              name: Routes.home.name,
              pageBuilder: (context, state) {
                _toggleDashboardTab(context, NavigationTab.home);
                return CustomPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
                );
              },
            ),
            GoRoute(
              path: Routes.moodStat.path,
              name: Routes.moodStat.name,
              pageBuilder: (context, state) {
                _toggleDashboardTab(context, NavigationTab.moodStat);
                return CustomPage(
                  key: state.pageKey,
                  child: const MoodStateScreen(),
                );
              },
            ),
            GoRoute(
              path: Routes.report.path,
              name: Routes.report.name,
              pageBuilder: (context, state) {
                _toggleDashboardTab(context, NavigationTab.report);
                return CustomPage(
                  key: state.pageKey,
                  child: const ReportScreen(),
                );
              },
            ),
            GoRoute(
              path: Routes.myHabits.path,
              name: Routes.myHabits.name,
              pageBuilder: (context, state) {
                _toggleDashboardTab(context, NavigationTab.myHabits);
                return CustomPage(
                  key: state.pageKey,
                  child: const MyHabitsScreen(),
                );
              },
            ),
            GoRoute(
              path: Routes.account.path,
              name: Routes.account.name,
              pageBuilder: (context, state) {
                _toggleDashboardTab(context, NavigationTab.account);
                return CustomPage(
                  key: state.pageKey,
                  child: const AccountScreen(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

void _toggleDashboardTab(BuildContext context, NavigationTab tab) {
  Future.delayed(
    Duration.zero,
    () => ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider.notifier)
        .setTabIndex(tab.index),
  );
}

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
            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: Curves.decelerate),
            );
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 400),
        );
}
