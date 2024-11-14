import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomTabs extends ConsumerStatefulWidget {
  const BottomTabs({super.key});

  @override
  ConsumerState createState() => _BottomTabsState();
}

class _BottomTabsState extends ConsumerState<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    return BottomNavigationBar(
      currentIndex: indexBottomNavbar,
      onTap: (value) =>
          ref.read(indexBottomNavbarProvider.notifier).update((state) => value),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 50,
      unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: 'Episodes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Locations',
        ),
      ],
    );
  }
}

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});
