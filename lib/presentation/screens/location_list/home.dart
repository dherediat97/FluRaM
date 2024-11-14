import 'package:fluram/presentation/screens/common/bottom_tabs.dart';
import 'package:fluram/presentation/screens/common/top_app_bar.dart';
import 'package:fluram/presentation/screens/location_list/widgets/location_list_view.dart';
import 'package:fluram/presentation/view_models/location_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationList extends ConsumerStatefulWidget {
  const LocationList({super.key});

  @override
  ConsumerState<LocationList> createState() => _LocationListState();
}

class _LocationListState extends ConsumerState<LocationList> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(fetchAllLocationsProvider);

    return Scaffold(
      appBar:
          const PreferredSize(preferredSize: Size(56, 56), child: TopAppBar()),
      bottomNavigationBar: const BottomTabs(),
      body: provider.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            children: [LocationListView(locationList: data.results)],
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
