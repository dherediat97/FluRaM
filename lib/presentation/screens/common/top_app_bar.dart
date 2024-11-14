import 'package:fluram/presentation/view_models/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAppBar extends ConsumerStatefulWidget {
  const TopAppBar({super.key});

  @override
  ConsumerState createState() => _TopAppBarState();
}

class _TopAppBarState extends ConsumerState<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(appProvider);
    return AppBar(
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
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
      ],
      title: Text(
        'FluRaM',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
