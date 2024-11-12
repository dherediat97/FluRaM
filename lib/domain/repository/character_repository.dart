import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/data_character_list.dart';

abstract class CharacterRepository {
  Future<DataCharacterList> getAllCharacters();
  Future<CharacterEntity> getCharacter(String id);
}
