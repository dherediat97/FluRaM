import 'package:fluram/domain/model/character_entity.dart';
import 'package:fluram/domain/model/enums_character_list.dart';
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
    return Card(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          Image.network(
            widget.character.image,
            fit: BoxFit.cover,
          ),
          Text(
            widget.character.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                  color: widget.character.status == Status.Alive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.red,
                  shape: const CircleBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "${widget.character.status.name} - ${widget.character.species.name}",
                ),
              ),
            ],
          ),
          Text("Last location:  ${widget.character.location!.name}"),
          if (widget.character.origin!.name != "unknown")
            Text("From:  ${widget.character.origin!.name}"),
        ],
      ),
    );
  }
}
