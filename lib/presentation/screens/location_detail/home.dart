import 'package:fluram/presentation/screens/common/bottom_tabs.dart';
import 'package:fluram/presentation/screens/common/top_app_bar.dart';
import 'package:fluram/presentation/notifiers/location_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationDetail extends ConsumerStatefulWidget {
  const LocationDetail({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<LocationDetail> createState() => _LocationDetailState();
}

class _LocationDetailState extends ConsumerState<LocationDetail> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(fetchLocationProvider(widget.id));

    return Scaffold(
      bottomNavigationBar: const BottomTabs(),
      appBar:
          const PreferredSize(preferredSize: Size(56, 56), child: TopAppBar()),
      body: provider.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            children: [Text(data.name)],
          ),
        ),
        error: (error, stack) => Text(stack.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
