import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_character_list.freezed.dart';
part 'location_character_list.g.dart';

@freezed
class LocationCharacterList with _$LocationCharacterList {
  const factory LocationCharacterList({
    required String name,
    required String url,
  }) = _LocationCharacterList;

  factory LocationCharacterList.fromJson(Map<String, dynamic> json) =>
      _$LocationCharacterListFromJson(json);
}
