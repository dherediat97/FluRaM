import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/data_character_list.dart';
import 'package:fluram/domain/use_case/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_notifier.g.dart';

@riverpod
Future<DataCharacterList> fetchAllCharacters(Ref ref) async {
  var response = await ref.watch(characterProvider).getAllCharacters();
  return response;
}

@riverpod
Future<CharacterEntity> fetchCharacter(Ref ref, String id) async {
  var response = await ref.watch(characterProvider).getCharacter(id);
  return response;
}
