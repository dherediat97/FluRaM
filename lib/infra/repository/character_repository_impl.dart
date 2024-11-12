import 'package:dio/dio.dart';
import 'package:fluram/core/internet_services/dio_client.dart';
import 'package:fluram/core/internet_services/http_exception.dart';
import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/data_character_list.dart';
import 'package:fluram/domain/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<DataCharacterList> getAllCharacters() async {
    try {
      final response = await DioClient.instance.get("character");
      final characterList = DataCharacterList.fromJson(response);
      return characterList;
    } on DioException catch (e) {
      var error = HttpException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<CharacterEntity> getCharacter(String id) async {
    try {
      final response = await DioClient.instance.get("character/$id");
      final characterList = CharacterEntity.fromJson(response);
      return characterList;
    } on DioException catch (e) {
      var error = HttpException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
