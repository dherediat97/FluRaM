import 'package:dio/dio.dart';
import 'package:fluram/core/internet_services/dio_client.dart';
import 'package:fluram/core/internet_services/http_exception.dart';
import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    try {
      final response = await DioClient.instance.get("character");
      final characterList = (response["results"] as List)
          .map((e) => CharacterEntity.fromJson(e))
          .toList();
      return characterList;
    } on DioException catch (e) {
      var error = HttpException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
