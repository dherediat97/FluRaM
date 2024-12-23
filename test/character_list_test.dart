import 'dart:io';
import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/enums_character_list.dart';
import 'package:fluram/domain/model/location_entity.dart';
import 'package:fluram/domain/repository/character_repository.dart';
import 'package:fluram/presentation/screens/character_list/widgets/character_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeRepository implements CharacterRepository {
  @override
  Future<(int totalItems, List<CharacterEntity> items)> getAllCharacters({
    int? page,
  }) async {
    return (
      25,
      [
        CharacterEntity(
          id: 1,
          name: 'Rick',
          type: '',
          url: '',
          species: 'Human',
          status: Status.Alive,
          created: DateTime.now(),
          episode: [],
          gender: Gender.Male,
          location: LocationEntity(
            id: 1,
            name: 'Earth',
            type: '',
            dimension: '',
            residents: [],
            url: '',
            created: DateTime.now(),
          ),
          image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        )
      ],
    );
  }

  @override
  Future<CharacterEntity> getCharacter(String id) async {
    return CharacterEntity(
      id: 1,
      name: 'Rick',
      type: '',
      url: '',
      species: 'Human',
      status: Status.Alive,
      created: DateTime.now(),
      episode: [],
      gender: Gender.Male,
      location: LocationEntity(
        id: 1,
        name: 'Earth',
        type: '',
        dimension: '',
        residents: [],
        url: '',
        created: DateTime.now(),
      ),
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    );
  }
}

final repositoryProvider = Provider((ref) => FakeRepository());
final todoListProvider = FutureProvider((ref) async {
  final repository = ref.read(repositoryProvider);
  return repository.getAllCharacters(page: 1);
});

void main() {
  setUpAll(() => HttpOverrides.global = null);
  testWidgets('override repositoryProvider', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [repositoryProvider.overrideWithValue(FakeRepository())],
        // Nuestra aplicación, que leerá desde todoListProvider para mostrar la lista de tareas pendientes.
        // Probablemente extraigas esto en un widget de MyApp
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(builder: (context, ref, _) {
              final todos = ref.watch(todoListProvider);
              // La lista de tareas está cargando o en error
              if (todos.asData == null) {
                return const CircularProgressIndicator();
              }
              return GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 520,
                  mainAxisExtent: 400,
                ),
                children: [
                  for (final character in todos.asData!.valueOrNull!.$2)
                    CharacterListItem(character: character)
                ],
              );
            }),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // Sin estado de carga.
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Renderizó una tarea con los datos devueltos por FakeRepository
    expect(tester.widgetList(find.byType(CharacterListItem)), [
      isA<CharacterListItem>()
          .having((widget) => widget.character.name, 'character.name', 'Rick')
          .having((widget) => widget.character.location!.name,
              'character.location.name', 'Earth'),
    ]);
  });
}
