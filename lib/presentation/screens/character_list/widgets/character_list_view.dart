import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/presentation/screens/character_list/widgets/character_list_item.dart';
import 'package:fluram/presentation/view_models/character_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CharacterListView extends ConsumerStatefulWidget {
  const CharacterListView({
    super.key,
    required this.characterList,
  });

  final List<CharacterEntity> characterList;

  @override
  ConsumerState<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends ConsumerState<CharacterListView> {
  CharacterViewModel get viewModel =>
      ref.read(charactersViewModelProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final charactersState = ref.watch(charactersViewModelProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        const itemHeight = 550.0;
        const itemWidth = 250.0;
        final crossCount = (width / itemWidth).ceil();

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.axisDirection ==
                    AxisDirection.down &&
                scrollNotification.metrics.pixels >=
                    scrollNotification.metrics.maxScrollExtent) {
              if (viewModel.canLoadMore) {
                viewModel.loadNextPage();
              }
            }
            return true;
          },
          child: GridView.builder(
            key: const PageStorageKey("characterGrid"),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: itemWidth / itemHeight,
            ),
            padding: const EdgeInsets.all(16),
            itemCount: charactersState.valueOrNull?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var character = charactersState.valueOrNull![index];
              return InkWell(
                onTap: () => context.go(
                  "/character/details",
                  extra: character.id.toString(),
                ),
                child: CharacterListItem(character: character),
              );
            },
          ),
        );
      },
    );
  }
}
