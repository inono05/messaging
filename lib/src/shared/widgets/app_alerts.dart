import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../shared.dart';

enum _AppAlertType { success, error, info }

class AppAlerts extends StatelessWidget {
  final String message;
  final String title;
  final _AppAlertType _appAlertType;
  final VoidCallback? onPressed;

  const AppAlerts({
    super.key,
    required this.message,
    this.onPressed,
    this.title = "",
  }) : _appAlertType = _AppAlertType.info;

  const AppAlerts.error({
    super.key,
    required this.message,
    this.onPressed,
    this.title = "",
  }) : _appAlertType = _AppAlertType.error;

  const AppAlerts.success({
    super.key,
    required this.message,
    this.onPressed,
    this.title = "",
  }) : _appAlertType = _AppAlertType.success;

  @override
  Widget build(BuildContext context) {
    late Widget alertIcon;
    late String alertTitle;
    late String description;
    switch (_appAlertType) {
      case _AppAlertType.success:
        alertIcon = Icon(
          Iconsax.check,
          color: context.primary,
          size: AppSize.p64,
        );
        alertTitle = title;
        description = message;
        break;
      case _AppAlertType.error:
        alertIcon = Icon(
          Iconsax.trash,
          color: context.error,
          size: AppSize.p64,
        );
        alertTitle = title;
        description = message;
        break;
      case _AppAlertType.info:
        alertIcon = Icon(
          Iconsax.info_circle,
          color: context.primary,
          size: AppSize.p64,
        );
        alertTitle = title;
        description = message;
        break;
    }
    return AlertDialog(
      elevation: AppSize.p55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.p12),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          alertIcon,
          if (alertTitle.isNotEmpty) gapH4,
          if (alertTitle.isNotEmpty)
            AppText(title: alertTitle, textAlign: TextAlign.center),
          gapH8,
          AppText.h5(
            title: description,
            textAlign: TextAlign.center,
            maxLines: 7,
          ),
        ],
      ).paddingAll(AppSize.p16),
    );
  }
}
