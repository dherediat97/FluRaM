import 'package:fluram/presentation/screens/character_list.dart';
import 'package:fluram/presentation/view_models/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(appProvider);

    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        items: const [
          BottomNavigationBarItem(
            tooltip: "Episodios",
            icon: Icon(Icons.tv),
            label: "Episodios",
          ),
          BottomNavigationBarItem(
            tooltip: "Ubicaciones",
            icon: Icon(Icons.local_gas_station_outlined),
            label: "Ubicaciones",
          ),
        ],
      ),
      body: const CharacterList(),
    );
  }
}
