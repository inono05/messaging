import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:messaging/src/shared/shared.dart';

enum _ButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool iconOnRight;
  final bool? isLoading;
  final VoidCallback? onPressed;
  final _ButtonType _buttonType;

  const AppButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.iconOnRight = false,
  }) : _buttonType = _ButtonType.primary;

  const AppButton.secondary({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.iconOnRight = false,
  }) : _buttonType = _ButtonType.secondary;

  @override
  Widget build(BuildContext context) {
    late Color bgColor;
    late Color fgColor;

    switch (_buttonType) {
      case _ButtonType.primary:
        bgColor = context.primary;
        fgColor = context.onPrimary;
        break;
      case _ButtonType.secondary:
        bgColor = context.secondary;
        fgColor = context.onSecondary;
        break;
    }

    return SizedBox(
      height: AppSize.p55,
      width: context.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          elevation: 5.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.p10),
            side: const BorderSide(width: 0.0, color: Colors.transparent),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              if (!iconOnRight) Icon(icon!, color: context.surface),
              gapW20,
              Expanded(
                child: (isLoading == true)
                    ? SpinKitRipple(color: context.surface, size: AppSize.p25)
                    : AppText(title: title, textAlign: TextAlign.center, color: context.onTertiary),
              ),
              gapW20,
              if (iconOnRight) Icon(icon!, color: context.surface),
            ] else
              (isLoading == true)
                  ? SpinKitRipple(color: context.primary, size: AppSize.p25)
                  : AppText(title: title, textAlign: TextAlign.center, color: context.onTertiary),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).slide().paddingSymmetric(horizontal: AppSize.p4);
  }
}
