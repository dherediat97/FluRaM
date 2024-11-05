import 'package:fluram/domain/model/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getAllCharacters();
}
