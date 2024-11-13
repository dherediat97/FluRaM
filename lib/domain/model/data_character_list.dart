import 'package:fluram/domain/model/info_entity.dart';
import 'package:fluram/remote/models/character_remote_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_character_list.freezed.dart';
part 'data_character_list.g.dart';

@freezed
class DataCharacterList with _$DataCharacterList {
  const factory DataCharacterList({
    required InfoEntity info,
    required List<CharacterRemoteEntity> results,
  }) = _DataCharacterList;

  factory DataCharacterList.fromJson(Map<String, dynamic> json) =>
      _$DataCharacterListFromJson(json);
}
