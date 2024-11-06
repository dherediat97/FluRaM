import 'package:fluram/domain/model/location_entity.dart';
import 'package:flutter/material.dart';

class LocationListItem extends StatefulWidget {
  const LocationListItem({
    super.key,
    required this.location,
  });

  final LocationEntity location;

  @override
  State<LocationListItem> createState() => _LocationListItem();
}

class _LocationListItem extends State<LocationListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.location.name),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Dimension: "),
              Text(widget.location.dimension!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Location type: "),
              Text(widget.location.type!),
            ],
          ),
        ],
      ),
    );
  }
}
