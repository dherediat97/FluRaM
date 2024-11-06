import 'package:fluram/domain/model/data_location_list.dart';

abstract class LocationRepository {
  Future<DataLocationList> getAllLocations();
}
