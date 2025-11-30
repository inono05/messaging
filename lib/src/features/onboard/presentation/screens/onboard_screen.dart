import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../shared/shared.dart';

class OnboardScreen extends ConsumerWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        children: [
          PageView(
            children: [
              Icon(
                Iconsax.calendar,
                size: AppSize.p120,
                color: context.primary,
              ).toCenter(),
              Icon(
                Iconsax.calendar_edit,
                size: AppSize.p120,
                color: context.primary,
              ).toCenter(),
              Icon(
                Iconsax.calendar_2,
                size: AppSize.p120,
                color: context.primary,
              ).toCenter(),
            ],
          ).expanded(flex: 7),
          AppButton(
            onPressed: () => context.goNamed(AppRoutes.login.name),
            title: 'Go to Tasks',
          ).paddingSymmetric(horizontal: AppSize.p20).toCenter(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
