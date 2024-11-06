import 'package:fluram/presentation/screens/home_page.dart';
import 'package:fluram/presentation/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: routerKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
        routes: [
          GoRoute(
            path: 'main',
            builder: (context, state) {
              return const HomePage();
            },
          )
        ],
      ),
    ],
  );
}
