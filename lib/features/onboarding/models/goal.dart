import 'package:animated_emoji/animated_emoji.dart';

enum Goal {
  buildHealthyHabits,
  boostProductivity,
  achievePersonalGoals,
  manageStressAndAnxiety,
  other,
}

extension GoalX on Goal {
  String get displayName {
    switch (this) {
      case Goal.buildHealthyHabits:
        return 'Build healthy habits';
      case Goal.boostProductivity:
        return 'Boost productivity';
      case Goal.achievePersonalGoals:
        return 'Achieve personal goals';
      case Goal.manageStressAndAnxiety:
        return 'Manage stress and anxiety';
      case Goal.other:
        return 'Other';
    }
  }

  AnimatedEmojiData get emoji {
    switch (this) {
      case Goal.buildHealthyHabits:
        return AnimatedEmojis.muscle;
      case Goal.boostProductivity:
        return AnimatedEmojis.rocket;
      case Goal.achievePersonalGoals:
        return AnimatedEmojis.moneyWithWings;
      case Goal.manageStressAndAnxiety:
        return AnimatedEmojis.halo;
      case Goal.other:
        return AnimatedEmojis.starStruck;
    }
  }
}
