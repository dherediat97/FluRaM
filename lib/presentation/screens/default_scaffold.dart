import 'package:fluram/presentation/view_models/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DefaultScaffold extends ConsumerWidget {
  const DefaultScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(appProvider);

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
        currentIndex: 0,
        onTap: (value) {
          switch (value) {
            case 0:
              context.push("/character");
              break;
            case 1:
              context.push("/location");
              break;
          }
        },
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
            icon: Icon(Icons.public),
            label: "Locations",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: body,
      ),
    );
  }
}
