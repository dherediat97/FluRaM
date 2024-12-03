import 'package:fluram/domain/model/data_location_list.dart';
import 'package:fluram/domain/model/location_entity.dart';
import 'package:fluram/domain/use_case/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_notifier.g.dart';

@riverpod
Future<DataLocationList> fetchAllLocations(Ref ref) async {
  var response = await ref.watch(locationProvider).getAllLocations();
  return response;
}

@riverpod
Future<LocationEntity> fetchLocation(Ref ref, String id) async {
  var response = await ref.watch(locationProvider).getLocation(id);
  return response;
}
