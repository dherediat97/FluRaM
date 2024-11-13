import 'package:fluram/presentation/screens/character_list/widgets/character_list_view.dart';
import 'package:fluram/presentation/view_models/character_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterList extends ConsumerStatefulWidget {
  const CharacterList({super.key});

  @override
  ConsumerState createState() => _CharacterListState();
}

class _CharacterListState extends ConsumerState<CharacterList> {
  @override
  Widget build(BuildContext context) {
    // ref.listen(charactersViewModelProvider, (_, state) {
    //   if (!state.isLoading && state.hasError) {
    //     context.showErrorSnackBar(state.dioException.errorMessage);
    //   }
    // });
    final charactersState = ref.watch(charactersViewModelProvider);

    return Scaffold(
      body: charactersState.when(
        data: (data) =>
            CharacterListView(characterList: charactersState.value ?? []),
        error: (error, stack) {
          return Text(stack.toString());
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
