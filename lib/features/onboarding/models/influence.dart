import 'package:animated_emoji/animated_emoji.dart';

enum Influence {
  lackOfMotivation,
  workOverload,
  clutteredEnvironment,
  digitalDistractions,
  lackOfTimeManagement,
}

extension InfluenceX on Influence {
  String get displayName {
    switch (this) {
      case Influence.lackOfMotivation:
        return 'Lack of motivation';
      case Influence.workOverload:
        return 'Work overload';
      case Influence.clutteredEnvironment:
        return 'Cluttered environment';
      case Influence.digitalDistractions:
        return 'Digital distractions';
      case Influence.lackOfTimeManagement:
        return 'Lack of time management';
    }
  }

  AnimatedEmojiData get emoji {
    switch (this) {
      case Influence.lackOfMotivation:
        return AnimatedEmojis.directHit;
      case Influence.workOverload:
        return AnimatedEmojis.mindBlown;
      case Influence.clutteredEnvironment:
        return AnimatedEmojis.clown;
      case Influence.digitalDistractions:
        return AnimatedEmojis.cameraFlash;
      case Influence.lackOfTimeManagement:
        return AnimatedEmojis.fireworks;
    }
  }
}