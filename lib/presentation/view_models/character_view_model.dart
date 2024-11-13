import 'dart:async';

import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/use_case/character_use_case.dart';
import 'package:fluram/domain/use_case/provider.dart';
import 'package:fluram/presentation/view_models/pagination_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final charactersViewModelProvider =
    AsyncNotifierProvider<CharacterViewModel, List<CharacterEntity>>(
  () => CharacterViewModel(),
);

class CharacterViewModel extends AsyncNotifier<List<CharacterEntity>>
    with AsyncPaginationController<CharacterEntity, int> {
  CharacterUseCase get repository => ref.read(characterProvider);

  var _canLoadMore = true;

  get canLoadMore => _canLoadMore;

  @override
  int get initialPage => 1;

  @override
  FutureOr<List<CharacterEntity>> loadPage(int page) async {
    final (totalItems, items) = await repository.getAllCharacters(page: page);
    final previousLength = state.valueOrNull?.length ?? 0;
    _canLoadMore = previousLength + items.length < totalItems;
    return items;
  }

  @override
  int nextPage(int currentPage) => currentPage + 1;
}
