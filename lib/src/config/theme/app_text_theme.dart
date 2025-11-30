import 'package:flutter/material.dart';

import '../../../generated/fonts.gen.dart';
import '../../shared/constants/app_size.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme({required ColorScheme colorScheme}) => TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h0,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w800,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h1,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h2,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h3,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h4,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h5,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.euclid,
      fontSize: AppSize.h6,
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
  );
}
