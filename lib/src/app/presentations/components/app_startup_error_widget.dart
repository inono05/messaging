import 'package:flutter/material.dart';
import 'package:messaging/src/shared/shared.dart';

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              title: message,
              color: context.surface,
            ),
            gapH16,
            ElevatedButton(
              onPressed: onRetry,
              child: const AppText(title: 'Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
