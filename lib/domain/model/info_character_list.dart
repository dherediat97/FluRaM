import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_character_list.freezed.dart';
part 'info_character_list.g.dart';

@freezed
class InfoCharacterList with _$InfoCharacterList {
  const factory InfoCharacterList({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _InfoCharacterList;

  factory InfoCharacterList.fromJson(Map<String, dynamic> json) =>
      _$InfoCharacterListFromJson(json);
}
