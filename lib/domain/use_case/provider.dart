import 'package:fluram/domain/use_case/character_use_case.dart';
import 'package:fluram/domain/use_case/location_use_case.dart';
import 'package:fluram/infra/repository/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final characterProvider = Provider<CharacterUseCase>((ref) {
  return CharacterUseCaseImpl(ref.read(charactersListProvider));
});

final locationProvider = Provider<LocationUseCase>((ref) {
  return LocationUseCaseImpl(ref.read(locationListProvider));
});
