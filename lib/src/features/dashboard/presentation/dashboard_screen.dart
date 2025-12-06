import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:messaging/src/features/dashboard/presentation/providers/server_checker_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../shared/shared.dart';
import 'components/webview_error_widget.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  final String? webUrl;

  const DashboardScreen({super.key, this.webUrl});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            ref.read(webViewErrorProvider.notifier).state = true;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.webUrl!));
  }

  @override
  Widget build(BuildContext context) {
    final serverStatus = ref.watch(serverCheckerProvider);
    final webviewError = ref.watch(webViewErrorProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        toolbarHeight: 40.0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Iconsax.arrow_left, color: context.primary),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.reload();
        },
        child: SingleChildScrollView(
          child: (serverStatus.available == null)
              ? SpinKitChasingDots(color: context.primary).toCenter()
              : (serverStatus.available == false)
              ? WebviewErrorWidget(
                  controller: controller,
                  message: AppConstants.serverNotAvailableMessage,
                )
              : (webviewError)
              ? WebviewErrorWidget(
                  controller: controller,
                  message: AppConstants.serverNotErrorMessage,
                )
              : WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
