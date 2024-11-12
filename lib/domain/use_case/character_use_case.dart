import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/data_character_list.dart';
import 'package:fluram/domain/repository/character_repository.dart';

abstract class CharacterUseCase {
  Future<DataCharacterList> getAllCharacters();
  Future<CharacterEntity> getCharacter(String id);
}

class CharacterUseCaseImpl extends CharacterUseCase {
  final CharacterRepository characterRepository;

  CharacterUseCaseImpl(this.characterRepository);

  @override
  Future<DataCharacterList> getAllCharacters() async {
    return await characterRepository.getAllCharacters();
  }

  @override
  Future<CharacterEntity> getCharacter(String id) async {
    return await characterRepository.getCharacter(id);
  }
}
