import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/routes/app_router.dart';
import '../../../config/theme/app_theme.dart';
import '../../../config/theme/providers/theme_notifier.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      //ref.read(fcmNotifierProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeNotifierProvider);
    //final systemUiOverlayStyle = ref.watch(appSystemUIOverlayProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
    ); // appRouter
  }
}
