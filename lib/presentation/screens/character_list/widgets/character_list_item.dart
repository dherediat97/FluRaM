import 'package:fluram/domain/model/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterListItem extends StatefulWidget {
  const CharacterListItem({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  @override
  State<CharacterListItem> createState() => _CharacterListItemState();
}

class _CharacterListItemState extends State<CharacterListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.network(
          widget.character.image,
        ),
      ),
      title: Text(widget.character.name),
      subtitle: Text(widget.character.location!.name),
    );
  }
}
