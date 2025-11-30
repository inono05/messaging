import 'package:flutter/material.dart';

import '../shared.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.radius = AppSize.p10,
    this.elevation = 1.2,
    this.color = Colors.white,
    required this.child,
    this.hPadding,
    this.vPadding,
  });

  final double radius;
  final double elevation;
  final Color color;
  final Widget child;
  final double? hPadding;
  final double? vPadding;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation,
      color: color,
      shadowColor: Colors.white60,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: child,
    ).paddingSymmetric(
      horizontal: hPadding ?? AppSize.p10,
      vertical: vPadding ?? AppSize.p10,
    );
  }
}
