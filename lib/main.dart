import 'package:fluram/core/app/app_router.dart';
import 'package:fluram/core/app/app_theme.dart';
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
    final router = ref.read(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
