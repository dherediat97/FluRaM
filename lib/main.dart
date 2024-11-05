import 'package:fluram/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF08C952),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFFCE46D),
          onSecondary: Color(0xFFFFFFFF),
          tertiary: Color(0xFF160440),
          onTertiary: Color(0xFFFFFFFF),
        ),
      ),
      routerConfig: router,
    );
  }
}
