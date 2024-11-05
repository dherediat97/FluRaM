import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/repository/character_repository.dart';

abstract class CharacterUseCase {
  Future<List<CharacterEntity>> getAllCharacters();
}

class CharacterUseCaseImpl extends CharacterUseCase {
  final CharacterRepository characterRepository;

  CharacterUseCaseImpl(this.characterRepository);

  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    return await characterRepository.getAllCharacters();
  }
}
