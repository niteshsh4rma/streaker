import 'package:animated_emoji/animated_emoji.dart';

enum Procrastinate {
  always,
  sometimes,
  rarely,
  never,
}

extension ProcrastinateX on Procrastinate {
  String get displayName {
    switch (this) {
      case Procrastinate.always:
        return 'Always';
      case Procrastinate.sometimes:
        return 'Sometimes';
      case Procrastinate.rarely:
        return 'Rarely';
      case Procrastinate.never:
        return 'Never';
    }
  }

  AnimatedEmojiData get emoji {
    switch (this) {
      case Procrastinate.always:
        return AnimatedEmojis.anxiousWithSweat;
      case Procrastinate.sometimes:
        return AnimatedEmojis.sweat;
      case Procrastinate.rarely:
        return AnimatedEmojis.grinSweat;
      case Procrastinate.never:
        return AnimatedEmojis.sunglassesFace;
    }
  }
}
