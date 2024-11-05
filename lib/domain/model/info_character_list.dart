import 'package:fluram/domain/model/enums_character_list.dart';
import 'package:fluram/domain/model/location_character_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_character_list.freezed.dart';
part 'info_character_list.g.dart';

@freezed
class InfoCharacterList with _$InfoCharacterList {
  const factory InfoCharacterList({
    required int id,
    required String name,
    required Status status,
    required Species species,
    required String type,
    required Gender gender,
    required LocationCharacterList origin,
    required LocationCharacterList location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _InfoCharacterList;

  factory InfoCharacterList.fromJson(Map<String, dynamic> json) =>
      _$InfoCharacterListFromJson(json);
}
