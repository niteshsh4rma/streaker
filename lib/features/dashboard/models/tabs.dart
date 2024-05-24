import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

enum NavigationTab {
  home,
  moodStat,
  report,
  myHabits,
  account,
}

extension TabExtension on NavigationTab {
  String get label {
    switch (this) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.moodStat:
        return 'Mood Stat';
      case NavigationTab.report:
        return 'Report';
      case NavigationTab.myHabits:
        return 'My habits';
      case NavigationTab.account:
        return 'Account';
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationTab.home:
        return Iconsax.home;
      case NavigationTab.moodStat:
        return Iconsax.smileys;
      case NavigationTab.report:
        return Iconsax.chart_215;
      case NavigationTab.myHabits:
        return Iconsax.menu;
      case NavigationTab.account:
        return Iconsax.user;
    }
  }
}
