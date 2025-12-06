import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:messaging/src/shared/shared.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../providers/server_checker_provider.dart';

class WebviewErrorWidget extends ConsumerWidget {
  final String message;
  final WebViewController controller;

  const WebviewErrorWidget({super.key, required this.message, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(Iconsax.warning_2, size: AppSize.p64, color: context.error),
          gapH16,
          AppText(title: message, textAlign: TextAlign.center),
          gapH32,
          ElevatedButton.icon(
            onPressed: () {
              ref.read(webViewErrorProvider.notifier).state = false;
              controller.reload();
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
