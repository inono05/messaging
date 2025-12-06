import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../../config/routes/app_router.dart';
import '../../../../config/theme/domain/entities/theme_mode_entity.dart';
import '../../../../config/theme/providers/theme_notifier.dart';
import '../../../../shared/shared.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      backgroundColor: context.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Messa',
                textScaler: TextScaler.linear(2.5),
                style: context.dMedium?.copyWith(
                  //color: context.secondary,
                  fontFamily: FontFamily.euclid,
                  foreground: Paint()
                    ..color = context.primary
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 2.5
                    ..strokeCap = StrokeCap.butt,
                  letterSpacing: 2.5,
                ),
              ),
              Text(
                'GING',
                textScaler: TextScaler.linear(3.5),
                style: context.dSmall?.copyWith(
                  //color: context.secondary,
                  fontFamily: FontFamily.euclid,
                  foreground: Paint()
                    ..color = context.secondary
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 2.5
                    ..strokeCap = StrokeCap.butt,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          SwitchListTile(
            value: themeMode.name == "dark" ? true : false,
            onChanged: (value) {
              log(value.toString());
              ref
                  .read(themeNotifierProvider.notifier)
                  .setTheme(value ? AppThemeMode.dark : AppThemeMode.light);
            },
            title: AppText(title: 'Dark Mode', color: context.tertiary),
          ),
          gapH50,
          AppButton(
            title: 'Dashboard',
            onPressed: () => context.pushNamed(
              AppRoutes.dashboard.name,
              pathParameters: {'url': AppConstants.webUrl},
            ),
          ),
          gapH20,
          AppButton.secondary(
            title: 'Messaging',
            onPressed: () => context.pushNamed(AppRoutes.chat.name),
          ),
          gapH50,
        ],
      ).paddingSymmetric(horizontal: AppSize.p12),
    );
  }
}
