import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messaging/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'screens.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//final _bibleNavKey = GlobalKey<NavigatorState>(debugLabel: 'bible');

enum AppRoutes { dashboard, splash, chat, imagePreview }

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
        pageBuilder: (context, state) => NoTransitionPage(child: const SplashScreen()),
      ),
      GoRoute(
        name: AppRoutes.chat.name,
        path: '/chat',
        pageBuilder: (context, state) => NoTransitionPage(child: const ChatScreen()),
      ),
      GoRoute(
        name: AppRoutes.imagePreview.name,
        path: '/image-preview',
        pageBuilder: (context, state) => NoTransitionPage(child: const ImagePreviewScreen()),
      ),
      GoRoute(
        name: AppRoutes.dashboard.name,
        path: '/dashboard/:url',
        pageBuilder: (context, state) {
          final String? url = state.pathParameters['url'];
          return NoTransitionPage(child: DashboardScreen(webUrl: url));
        },
      ),
    ],
  );
}
