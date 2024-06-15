import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';

TimeOfDay timeOfDayfromJson(String timeOfDay) {
  final parts = timeOfDay.split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

TimeOfDay? timeOfDayfromJsonNullable(String? timeOfDay) {
  if (timeOfDay == null) return null;
  final parts = timeOfDay.split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

String timeOfDaytoJson(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour}:${timeOfDay.minute}';
}

String? timeOfDaytoJsonNullable(TimeOfDay? timeOfDay) {
  if (timeOfDay == null) return null;
  return '${timeOfDay.hour}:${timeOfDay.minute}';
}

AnimatedEmojiData? emojiFromJson(Map<String, dynamic>? emoji) {
  if (emoji == null) {
    return null;
  }

  return AnimatedEmojiData(
    emoji['id'] as String,
    name: emoji['name'] as String,
  );
}

Map<String, dynamic>? emojiToJson(AnimatedEmojiData? emoji) {
  if (emoji == null) {
    return null;
  }

  return {
    'id': emoji.id,
    'name': emoji.name,
  };
}

Color colorFromJson(int color) {
  return Color(color);
}

int colorToJson(Color color) {
  return color.value;
}
