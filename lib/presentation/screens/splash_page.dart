import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  var animationChoosen = 0;
  final animationsAvailable = 2;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    animationChoosen = Random().nextInt(animationsAvailable) + 1;
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
          "assets/animations/splash_animation$animationChoosen.json",
          controller: _controller, onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..reverse()
          ..forward().whenComplete(
            () => context.push("/"),
          );
      }),
    );
  }
}
