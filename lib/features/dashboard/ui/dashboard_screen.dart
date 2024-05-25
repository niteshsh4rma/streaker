import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:streaker/core/routing/router.dart';
import 'package:streaker/features/dashboard/models/tabs.dart';
import 'package:streaker/features/dashboard/view_models/dashboard_view_model.dart';
import 'package:streaker/features/splash/ui/logo.dart';

class DashboardScreen extends ConsumerWidget {
  final Widget child;

  const DashboardScreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 55,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Logo(
            size: Size.square(40),
            repeat: false,
          ),
        ),
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Text(
            dashboardState.title,
            key: ValueKey<String>(dashboardState.title),
          ),
        ),
        actions: dashboardState.actions,
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: dashboardState.tabIndex,
        height: 64,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          if (index == dashboardState.tabIndex) return;
          onDestinationSelected(context, index);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(NavigationTab.home.icon),
            label: NavigationTab.home.label,
          ),
          NavigationDestination(
            icon: Icon(NavigationTab.moodStat.icon),
            label: NavigationTab.moodStat.label,
          ),
          NavigationDestination(
            icon: Icon(NavigationTab.report.icon),
            label: NavigationTab.report.label,
          ),
          NavigationDestination(
            icon: Icon(NavigationTab.myHabits.icon),
            label: NavigationTab.myHabits.label,
          ),
          NavigationDestination(
            icon: Icon(NavigationTab.account.icon),
            label: NavigationTab.account.label,
          ),
        ],
      ),
    );
  }

  void onDestinationSelected(BuildContext context, int value) {
    if (value == NavigationTab.home.index) {
      context.pushReplacementNamed(Routes.home.name);
    } else if (value == NavigationTab.moodStat.index) {
      context.pushReplacementNamed(Routes.moodStat.name);
    } else if (value == NavigationTab.report.index) {
      context.pushReplacementNamed(Routes.report.name);
    } else if (value == NavigationTab.myHabits.index) {
      context.pushReplacementNamed(Routes.myHabits.name);
    } else if (value == NavigationTab.account.index) {
      context.pushReplacementNamed(Routes.account.name);
    }
  }
}
