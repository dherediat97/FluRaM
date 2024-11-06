import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/data_character_list.dart';
import 'package:fluram/domain/use_case/character_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_notifier.g.dart';

class CharacterListProvider extends ChangeNotifier {
  final Ref ref;
  List<CharacterEntity> list = [];
  int page = 0;
  bool haveData = false;

  CharacterListProvider({required this.ref});
}

@riverpod
Future<DataCharacterList> fetchAllCharacters(Ref ref) async {
  var response = await ref.watch(characterProvider).getAllCharacters();
  return response;
}
