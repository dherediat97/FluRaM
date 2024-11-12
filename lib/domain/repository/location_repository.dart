import 'package:fluram/domain/model/data_location_list.dart';
import 'package:fluram/domain/model/location_entity.dart';

abstract class LocationRepository {
  Future<DataLocationList> getAllLocations();
  Future<LocationEntity> getLocation(String id);
}
