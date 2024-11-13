import 'package:fluram/domain/model/enums_character_list.dart';
import 'package:fluram/domain/model/location_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';
part 'character_entity.g.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  const factory CharacterEntity({
    required int id,
    required String name,
    required Status status,
    required String species,
    required String type,
    required Gender gender,
    LocationEntity? origin,
    LocationEntity? location,
    required String image,
    required List<String> episode,
    required String url,
    DateTime? created,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntityFromJson(json);
}
