import 'package:cached_network_image/cached_network_image.dart';
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surface,
      elevation: 20,
      child: Column(
        children: [
          Container(
            width: 340,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Hero(
              tag: widget.character.id,
              child: CachedNetworkImage(
                imageUrl: widget.character.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.character.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 12,
                      decoration: ShapeDecoration(
                        color: switch (widget.character.status) {
                          Status.Alive => Theme.of(context).colorScheme.primary,
                          Status.Dead => Colors.red,
                          Status.unknown => Colors.grey,
                        },
                        shape: const CircleBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.character.status.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.biotech),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        widget.character.species,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.public),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        widget.character.origin!.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
