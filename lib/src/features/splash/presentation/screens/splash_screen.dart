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
                'PLAN',
                textScaler: TextScaler.linear(2.5),
                style: context.dLarge?.copyWith(
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
                'IFY',
                textScaler: TextScaler.linear(3.5),
                style: context.dLarge?.copyWith(
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
          AppText.h0(
            title: 'The easiest way to Plan, Track and Manage your home tasks.',
            maxLines: 2,
            fontWeight: FontWeight.w600,
            textScaleFactor: 1.2,
          ).paddingOnly(left: AppSize.p16),
          SwitchListTile(
            value: themeMode.name == "dark" ? true : false,
            onChanged: (value) {
              log(value.toString());
              ref
                  .read(themeNotifierProvider.notifier)
                  .setTheme(value ? AppThemeMode.dark : AppThemeMode.light);
            },
            title: const AppText(title: 'Dark Mode'),
          ),
          gapW50,
          AppButton(
            title: 'Get Started',
            onPressed: () => context.goNamed(AppRoutes.onboarding.name),
          ),
        ],
      ),
    );
  }
}
