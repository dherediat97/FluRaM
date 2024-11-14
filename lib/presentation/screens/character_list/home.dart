import 'package:fluram/presentation/screens/character_list/widgets/character_list_view.dart';
import 'package:fluram/presentation/screens/common/bottom_tabs.dart';
import 'package:fluram/presentation/screens/common/top_app_bar.dart';
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
    final charactersState = ref.watch(charactersViewModelProvider);

    return Scaffold(
      appBar:
          const PreferredSize(preferredSize: Size(56, 56), child: TopAppBar()),
      bottomNavigationBar: const BottomTabs(),
      body: charactersState.when(
        data: (data) => CharacterListView(
          characterList: charactersState.value ?? [],
        ),
        error: (error, stack) => const Center(
          child: CircularProgressIndicator(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
