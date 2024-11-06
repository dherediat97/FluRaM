import 'package:fluram/app/app_routes.dart';
import 'package:fluram/presentation/view_models/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(appProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF08C952),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF08C952),
          onSecondary: Color(0xFFFFFFFF),
          tertiary: Color(0xFF160440),
          onTertiary: Color(0xFFFFFFFF),
          surface: Color(0xFF020C06),
          surfaceTint: Color(0xFF08C952),
        ),
      ),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF08C952),
          onPrimary: Color(0xFF020C06),
          secondary: Color(0xFF08C952),
          onSecondary: Color(0xFFFFFFFF),
          tertiary: Color(0xFF160440),
          onTertiary: Color(0xFFFFFFFF),
          surfaceTint: Color(0xFFFFFFFF),
        ),
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
