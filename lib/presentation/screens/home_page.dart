import 'package:fluram/presentation/screens/character_list/home.dart';
import 'package:fluram/presentation/screens/common/bottom_tabs.dart';
import 'package:fluram/presentation/screens/location_list/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    final bodies = [
      const CharacterList(),
      const LocationList(),
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: bodies[indexBottomNavbar],
      ),
    );
  }
}
