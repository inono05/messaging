import 'package:flutter/material.dart';

import '../../shared/constants/constants.dart';

class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme inputDecorationTheme({
    required ColorScheme colorScheme,
  }) {
    return InputDecorationTheme(
      border: _outlineInputBorder(colorScheme.secondary),
      focusedBorder: _outlineInputBorder(
        AppColors.lightColorScheme.secondary,
      ),
      errorBorder: _outlineInputBorder(colorScheme.error),
      enabledBorder: _outlineInputBorder(
        colorScheme.primary,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSize.p8,
        vertical: AppSize.p10,
      ),
    );
  }

  static OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.p8),
      borderSide: BorderSide(
        color: color,
        width: .71,
      ),
      gapPadding: AppSize.p12,
    );
  }
}