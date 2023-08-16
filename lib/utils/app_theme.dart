import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    double screenWidth = window.physicalSize.width;
    return ThemeData(
        fontFamily: 'Rubik',
        primaryColor: colors.backGroundColor,
        scaffoldBackgroundColor: colors.backGroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: colors.secondaryColor),
        backgroundColor: colors.backGroundColor);
  }
}
