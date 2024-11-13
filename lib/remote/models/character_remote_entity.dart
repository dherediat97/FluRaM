import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/enums_character_list.dart';
import 'package:fluram/domain/model/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_remote_entity.freezed.dart';
part 'character_remote_entity.g.dart';

@freezed
class CharacterRemoteEntity with _$CharacterRemoteEntity {
  const factory CharacterRemoteEntity({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'status') required Status status,
    @JsonKey(name: 'species') required String species,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'gender') required Gender gender,
    @JsonKey(name: 'origin') LocationEntity? origin,
    @JsonKey(name: 'location') LocationEntity? location,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'episode') required List<String> episode,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'created') DateTime? created,
  }) = _CharacterRemoteEntity;

  factory CharacterRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterRemoteEntityFromJson(json);
}

extension CharacterMapper on CharacterRemoteEntity {
  CharacterEntity toCharacterEntity() => CharacterEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin,
        location: location,
        image: image,
        episode: episode,
        url: url,
        created: created,
      );
}
