import 'package:flutter/material.dart';
import 'package:streaker/gen/colors.gen.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorName.primary),
  useMaterial3: true,
  brightness: Brightness.light,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);
