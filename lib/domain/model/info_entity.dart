import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_entity.freezed.dart';
part 'info_entity.g.dart';

@freezed
class InfoEntity with _$InfoEntity {
  const factory InfoEntity({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _InfoEntity;

  factory InfoEntity.fromJson(Map<String, dynamic> json) =>
      _$InfoEntityFromJson(json);
}
