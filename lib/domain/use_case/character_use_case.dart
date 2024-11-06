import 'package:fluram/domain/model/data_character_list.dart';
import 'package:fluram/domain/repository/character_repository.dart';

abstract class CharacterUseCase {
  Future<DataCharacterList> getAllCharacters();
}

class CharacterUseCaseImpl extends CharacterUseCase {
  final CharacterRepository characterRepository;

  CharacterUseCaseImpl(this.characterRepository);

  @override
  Future<DataCharacterList> getAllCharacters() async {
    return await characterRepository.getAllCharacters();
  }
}
