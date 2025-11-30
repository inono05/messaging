import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../generated/fonts.gen.dart';
import '../../shared/constants/constants.dart';
import 'app_input_theme.dart';
import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData _theme({required Brightness brightness}) {
    final ColorScheme colorScheme = brightness == Brightness.light
        ? AppColors.lightColorScheme
        : AppColors.darkColorScheme;

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
      textTheme: _textTheme(colorScheme: colorScheme).apply(
        fontFamily: FontFamily.euclid,
      ),
    ).copyWith(
      scaffoldBackgroundColor: colorScheme.outline,
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          _textTheme(colorScheme: colorScheme).headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        toolbarHeight: AppSize.p50 * 1.2,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness,
        ),
      ),
      inputDecorationTheme: AppInputTheme.inputDecorationTheme(
        colorScheme: colorScheme,
      ),
    );
  }

  static TextTheme _textTheme({required ColorScheme colorScheme}) {
    return AppTextTheme.textTheme(colorScheme: colorScheme);
  }

  static final ThemeData lightTheme = _theme(brightness: Brightness.light);
  static final ThemeData darkTheme = _theme(brightness: Brightness.dark);
}