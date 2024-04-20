import 'package:flutter/material.dart';
import 'package:streaker/gen/colors.gen.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorName.primary,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  brightness: Brightness.dark,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);