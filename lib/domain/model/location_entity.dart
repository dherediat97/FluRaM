import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_entity.freezed.dart';
part 'location_entity.g.dart';

@freezed
class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    required int? id,
    required String name,
    required String? type,
    required String? dimension,
    required List<String>? residents,
    required String? url,
    required DateTime? created,
  }) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);
}
