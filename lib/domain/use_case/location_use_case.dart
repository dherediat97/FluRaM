import 'package:fluram/domain/model/data_location_list.dart';
import 'package:fluram/domain/model/location_entity.dart';
import 'package:fluram/domain/repository/location_repository.dart';

abstract class LocationUseCase {
  Future<DataLocationList> getAllLocations();
  Future<LocationEntity> getLocation(String id);
}

class LocationUseCaseImpl extends LocationUseCase {
  final LocationRepository locationRepository;

  LocationUseCaseImpl(this.locationRepository);

  @override
  Future<DataLocationList> getAllLocations() async {
    return await locationRepository.getAllLocations();
  }

  @override
  Future<LocationEntity> getLocation(String id) async {
    return await locationRepository.getLocation(id);
  }
}
