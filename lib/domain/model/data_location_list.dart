import 'package:fluram/domain/model/info_entity.dart';
import 'package:fluram/domain/model/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_location_list.freezed.dart';
part 'data_location_list.g.dart';

@freezed
class DataLocationList with _$DataLocationList {
  const factory DataLocationList({
    required InfoEntity info,
    required List<LocationEntity> results,
  }) = _DataLocationList;

  factory DataLocationList.fromJson(Map<String, dynamic> json) =>
      _$DataLocationListFromJson(json);
}
