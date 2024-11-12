import 'package:fluram/domain/model/location_entity.dart';
import 'package:fluram/presentation/screens/location_list/widgets/location_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationListView extends StatefulWidget {
  const LocationListView({
    super.key,
    required this.locationList,
  });

  final List<LocationEntity> locationList;

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.locationList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var location = widget.locationList[index];
        return InkWell(
            onTap: () => context.go(
                  "/location/details",
                  extra: location.id.toString(),
                ),
            child: LocationListItem(location: location));
      },
    );
  }
}
