import 'package:fluram/presentation/screens/character_detail/home.dart';
import 'package:fluram/presentation/screens/character_list/home.dart';
import 'package:fluram/presentation/screens/home_page.dart';
import 'package:fluram/presentation/screens/location_detail/home.dart';
import 'package:fluram/presentation/screens/location_list/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final routerKey = GlobalKey<NavigatorState>();

  return GoRouter(
    initialLocation: '/',
    navigatorKey: routerKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/characters',
        builder: (context, state) => const CharacterList(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) {
              return CharacterDetail(id: state.extra as String);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/locations',
        builder: (context, state) {
          return const LocationList();
        },
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) {
              return LocationDetail(id: state.extra as String);
            },
          ),
        ],
      )
    ],
  );
}
