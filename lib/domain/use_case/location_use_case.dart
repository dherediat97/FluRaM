import 'package:fluram/domain/model/data_location_list.dart';
import 'package:fluram/domain/repository/location_repository.dart';

abstract class LocationUseCase {
  Future<DataLocationList> getAllLocations();
}

class LocationUseCaseImpl extends LocationUseCase {
  final LocationRepository locationRepository;

  LocationUseCaseImpl(this.locationRepository);

  @override
  Future<DataLocationList> getAllLocations() async {
    return await locationRepository.getAllLocations();
  }
}
