import 'package:fluram/presentation/screens/character_list/widgets/character_list_view.dart';
import 'package:fluram/presentation/view_models/character_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterList extends ConsumerStatefulWidget {
  const CharacterList({super.key});

  @override
  ConsumerState<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends ConsumerState<CharacterList> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(fetchAllCharactersProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: provider.when(
          data: (data) => SingleChildScrollView(
            child: Column(
              children: [CharacterListView(characterList: data.results)],
            ),
          ),
          error: (error, stack) => Text(stack.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
