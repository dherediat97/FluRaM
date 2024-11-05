import 'package:fluram/domain/repository/character_repository.dart';
import 'package:fluram/infra/repository/character_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final charactersListProvider = Provider<CharacterRepository>((ref) {
  return CharacterRepositoryImpl();
});
