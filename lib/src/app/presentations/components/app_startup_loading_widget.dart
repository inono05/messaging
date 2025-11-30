import 'package:flutter/material.dart';
import 'package:messaging/src/shared/shared.dart';

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: context.loader,
        ),
      ),
    );
  }
}
