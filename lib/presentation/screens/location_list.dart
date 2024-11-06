import 'package:fluram/presentation/screens/widgets/location_list_item.dart';
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: provider.when(
          data: (data) => SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: data.results.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LocationListItem(location: data.results[index]);
                  },
                )
              ],
            ),
          ),
          error: (error, stack) => Text(stack.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
