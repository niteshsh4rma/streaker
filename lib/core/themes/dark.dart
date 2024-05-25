import 'package:flutter/material.dart';
import 'package:streaker/gen/colors.gen.dart';

final ThemeData darkTheme = ThemeData(
  dividerColor: Colors.grey.shade600,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearMinHeight: 8,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorName.primary,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  useMaterial3: true,
  brightness: Brightness.dark,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);
