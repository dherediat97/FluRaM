import 'package:fluram/domain/model/character_entity.dart';

abstract class CharacterRepository {
  Future<(int totalItems, List<CharacterEntity> items)> getAllCharacters({
    int? page,
  });
  Future<CharacterEntity> getCharacter(String id);
}
