import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/presentation/screens/character_list/widgets/character_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({
    super.key,
    required this.characterList,
  });

  final List<CharacterEntity> characterList;

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 520,
        mainAxisExtent: 400,
      ),
      padding: const EdgeInsets.all(0),
      itemCount: widget.characterList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var character = widget.characterList[index];
        return InkWell(
          onTap: () => context.go(
            "/character/details",
            extra: character.id.toString(),
          ),
          child: CharacterListItem(character: character),
        );
      },
    );
  }
}
