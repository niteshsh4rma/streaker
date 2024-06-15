import 'package:flutter/material.dart';
import 'package:streaker/gen/colors.gen.dart';

final ThemeData lightTheme = ThemeData(
  dividerColor: Colors.grey.shade400,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearMinHeight: 8,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorName.background,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: ColorName.background,
  colorScheme: ColorScheme.fromSeed(seedColor: ColorName.primary),
  useMaterial3: true,
  brightness: Brightness.light,
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);
