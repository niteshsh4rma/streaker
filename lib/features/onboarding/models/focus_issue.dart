import 'package:animated_emoji/animated_emoji.dart';

enum FocusIssue {
  constantly,
  occasionally,
  rarely,
  never,
}

extension FocusIssueX on FocusIssue {
  String get displayName {
    switch (this) {
      case FocusIssue.constantly:
        return 'Constantly';
      case FocusIssue.occasionally:
        return 'Occasionally';
      case FocusIssue.rarely:
        return 'Rarely';
      case FocusIssue.never:
        return 'Never';
    }
  }

  AnimatedEmojiData get emoji {
    switch (this) {
      case FocusIssue.constantly:
        return AnimatedEmojis.loudlyCrying;
      case FocusIssue.occasionally:
        return AnimatedEmojis.sad;
      case FocusIssue.rarely:
        return AnimatedEmojis.squintingTongue;
      case FocusIssue.never:
        return AnimatedEmojis.grinning;
    }
  }
}
