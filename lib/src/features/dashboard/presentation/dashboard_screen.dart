import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardScreen extends StatefulWidget {
  final String? webUrl;
  const DashboardScreen({super.key, this.webUrl});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

   /* if (Platform.isAndroid) {
      WebView.platform = AndroidView();
    }*/

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.webUrl!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), toolbarHeight: 0,),
      body: WebViewWidget(controller: controller),
    );
  }
}
