import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_startup.dart';
import 'app_startup_error_widget.dart';
import 'app_startup_loading_widget.dart';

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => onLoaded(context),
      loading: () => const AppStartupLoadingWidget(),
      error:
          (e, st) => AppStartupErrorWidget(
            message: e.toString(),
            onRetry: () => ref.invalidate(appStartupProvider),
          ),
    );
  }
}
