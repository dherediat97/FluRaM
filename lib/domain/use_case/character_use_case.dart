import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/repository/character_repository.dart';

abstract class CharacterUseCase {
  Future<(int totalItems, List<CharacterEntity> items)> getAllCharacters({
    int? page,
  });
  Future<CharacterEntity> getCharacter(String id);
}

class CharacterUseCaseImpl extends CharacterUseCase {
  final CharacterRepository characterRepository;

  CharacterUseCaseImpl(this.characterRepository);

  @override
  Future<(int totalItems, List<CharacterEntity> items)> getAllCharacters({
    int? page,
  }) async {
    return await characterRepository.getAllCharacters(page: page);
  }

  @override
  Future<CharacterEntity> getCharacter(String id) async {
    return await characterRepository.getCharacter(id);
  }
}
