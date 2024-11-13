import 'package:dio/dio.dart';
import 'package:fluram/core/internet_services/dio_client.dart';
import 'package:fluram/core/internet_services/http_exception.dart';
import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/data_character_list.dart';
import 'package:fluram/domain/repository/character_repository.dart';
import 'package:fluram/remote/models/character_remote_entity.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<(int totalItems, List<CharacterEntity> items)> getAllCharacters({
    int? page,
  }) async {
    try {
      final response = await DioClient.instance.get("character/?page=$page");
      if (response.isEmpty) {
        return (0, <CharacterEntity>[]);
      }
      final characterResponse = DataCharacterList.fromJson(response);
      return (
        characterResponse.info.count,
        characterResponse.results.map((e) => e.toCharacterEntity()).toList()
      );
    } on DioException catch (e) {
      throw e.errorMessage;
    }
  }

  @override
  Future<CharacterEntity> getCharacter(String id) async {
    try {
      final response = await DioClient.instance.get("character/$id");
      final characterList = CharacterEntity.fromJson(response);
      return characterList;
    } on DioException catch (e) {
      throw e.errorMessage;
    }
  }
}
