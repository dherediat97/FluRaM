import 'package:fluram/domain/model/data_character_list.dart';

abstract class CharacterRepository {
  Future<DataCharacterList> getAllCharacters();
}
