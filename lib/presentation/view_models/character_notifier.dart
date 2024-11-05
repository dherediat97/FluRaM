import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/use_case/character_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterListProvider extends ChangeNotifier {
  final Ref ref;
  List<CharacterEntity> list = [];
  bool haveData = false;

  CharacterListProvider({required this.ref});

  Future<void> init() async {
    list = await ref.watch(characterProvider).getAllCharacters();
    haveData = true;
    notifyListeners();
  }
}

final getCharactersProvider = ChangeNotifierProvider<CharacterListProvider>(
  (ref) => CharacterListProvider(ref: ref),
);
