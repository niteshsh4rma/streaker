import 'package:animated_emoji/animated_emoji.dart';

enum Sleep {
  lessThan6,
  between6And7,
  between7And8,
  between8And9,
  moreThan9,
}

extension SleepX on Sleep {
  String get displayName {
    switch (this) {
      case Sleep.lessThan6:
        return 'Less than 6 hours';
      case Sleep.between6And7:
        return 'Between 6 and 7 hours';
      case Sleep.between7And8:
        return 'Between 7 and 8 hours';
      case Sleep.between8And9:
        return 'Between 8 and 9 hours';
      case Sleep.moreThan9:
        return 'More than 9 hours';
    }
  }

  AnimatedEmojiData get emoji {
    switch (this) {
      case Sleep.lessThan6:
        return AnimatedEmojis.sleepy;
      case Sleep.between6And7:
        return AnimatedEmojis.relieved;
      case Sleep.between7And8:
        return AnimatedEmojis.warmSmile;
      case Sleep.between8And9:
        return AnimatedEmojis.smirk;
      case Sleep.moreThan9:
        return AnimatedEmojis.grinSweat;
    }
  }
}
