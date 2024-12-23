import 'package:dio/dio.dart';
import 'package:fluram/core/internet_services/dio_client.dart';
import 'package:fluram/core/internet_services/http_exception.dart';
import 'package:fluram/domain/model/data_location_list.dart';
import 'package:fluram/domain/model/location_entity.dart';
import 'package:fluram/domain/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<DataLocationList> getAllLocations() async {
    try {
      final response = await DioClient.instance.get('location');
      final locationList = DataLocationList.fromJson(response);
      return locationList;
    } on DioException catch (e) {
      throw e.errorMessage;
    }
  }

  @override
  Future<LocationEntity> getLocation(String id) async {
    try {
      final response = await DioClient.instance.get('location/$id');
      final locationList = LocationEntity.fromJson(response);
      return locationList;
    } on DioException catch (e) {
      throw e.errorMessage;
    }
  }
}
