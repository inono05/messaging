import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messaging/src/app/presentations/components/app_startup_widget.dart';
import 'package:messaging/src/app/presentations/screens/application.dart';
import 'package:messaging/src/shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Register error handlers. For more info, see:
  registerErrorHandlers();
  // * Entry point of the app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  runApp(ProviderScope(child: AppStartupWidget(onLoaded: (context) => const Application())));
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    log(details.exceptionAsString());
    final error = details.exception.toString();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: AppContainer(
          elevation: AppSize.p25,
          radius: AppSize.p48,
          child: SizedBox(
            height: AppSize.p300,
            child: AppAlerts.error(
              message: (error.contains("timeout"))
                  ? "Oops! check your internet connexion and reload"
                  : details.exceptionAsString(),
            ),
          ).alignAtCenter(),
        ),
      ),
    ).toCenter();
  };
}
