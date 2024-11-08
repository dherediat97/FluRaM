import 'package:fluram/presentation/screens/character_list/character_list.dart';
import 'package:fluram/presentation/screens/location_list/location_list.dart';
import 'package:fluram/presentation/view_models/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(appProvider);
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    final bodies = [
      const CharacterList(),
      const LocationList(),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                ref.read(appProvider.notifier).toggle();
              },
              icon: Icon(
                darkMode ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          )
        ],
        title: Text(
          'FluRaM',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) => ref
            .read(indexBottomNavbarProvider.notifier)
            .update((state) => value),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 50,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: "Episodes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station_outlined),
            label: "Locations",
          ),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});
