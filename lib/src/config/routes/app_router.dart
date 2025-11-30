import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'screens.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//final _bibleNavKey = GlobalKey<NavigatorState>(debugLabel: 'bible');

enum AppRoutes {
  onboarding,
  login,
  register,
  splash,
  chat,
}

@riverpod
GoRouter appRouter(Ref ref) {
  //final isCompleted = ref.watch(entryRepositoryProvider).requireValue;
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    /*redirect: (context, state) {
      final isOnboarding = state.uri.path == '/onboarding';
      if (!isCompleted.isOnboardingComplete()) {
        if (!isOnboarding) {
          return '/onboarding';
        }
      }
      return null;
    },*/
    routes: [
      GoRoute(
        name: AppRoutes.splash.name,
        path: '/',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const SplashScreen()),
      ),
      GoRoute(
        name: AppRoutes.onboarding.name,
        path: '/onboarding',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const OnboardScreen()),
      ),

      GoRoute(
        name: AppRoutes.chat.name,
        path: '/tasks',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const ChatScreen()),
      ),
    ],
  );
}
