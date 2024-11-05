import 'package:fluram/domain/model/info_character_list.dart';
import 'package:fluram/domain/model/character_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_character_list.freezed.dart';
part 'data_character_list.g.dart';

@freezed
class DataCharacterList with _$DataCharacterList {
  const factory DataCharacterList({
    required InfoCharacterList info,
    required List<CharacterEntity> results,
  }) = _DataCharacterList;

  factory DataCharacterList.fromJson(Map<String, dynamic> json) =>
      _$DataCharacterListFromJson(json);
}
