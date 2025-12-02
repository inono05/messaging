import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/app_size.dart';

extension ContextExtension on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;

  // ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get tertiary => colorScheme.tertiary;
  Color get surface => colorScheme.surface;
  Color get surfaceContainerHighest => colorScheme.surfaceContainerHighest;
  Color get surfaceTint => colorScheme.surfaceTint;
  Color get error => colorScheme.error;
  Color get outline => colorScheme.outline;
  Color get errorContainer => colorScheme.errorContainer;
  Color get onError => colorScheme.onError;
  Color get onErrorContainer => colorScheme.onErrorContainer;
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onTertiary => colorScheme.onTertiary;
  Color get onSurface => colorScheme.onSurface;

  // TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle? get tLarge => textTheme.titleLarge;
  TextStyle? get dLarge => textTheme.displayLarge;
  TextStyle? get dMedium => textTheme.displayMedium;
  TextStyle? get dSmall => textTheme.displaySmall;
  TextStyle? get hLarge => textTheme.headlineLarge;
  TextStyle? get hMedium => textTheme.headlineMedium;
  TextStyle? get hSmall => textTheme.headlineSmall;

  TextStyle? get bLarge => textTheme.bodyMedium;
  TextStyle? get bMedium => textTheme.bodyMedium;
  TextStyle? get bSmall => textTheme.bodyMedium;
  ThemeData get theme => Theme.of(this);

  //spinkit loader extension
  Widget get loader => SpinKitRipple(color: primary, size: AppSize.p25);
}

extension MediaQueryX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
