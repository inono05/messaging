import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

import '../shared.dart';

class AppHelpers {
  static void toast(
    BuildContext context,
    String message, {
    bool isSuccess = false,
  }) {
    isSuccess
        ? CherryToast.success(
          title: Text(message, style: context.hLarge),
          borderRadius: AppSize.p8,
          backgroundColor: context.surface,
        ).show(context)
        : CherryToast.error(
          title: Text(message, style: context.hLarge),
          borderRadius: AppSize.p8,
          backgroundColor: context.surface,
        ).show(context);
  }
}
