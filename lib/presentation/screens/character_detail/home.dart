import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluram/presentation/screens/common/bottom_tabs.dart';
import 'package:fluram/presentation/screens/common/top_app_bar.dart';
import 'package:fluram/presentation/notifiers/character_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterDetail extends ConsumerStatefulWidget {
  const CharacterDetail({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends ConsumerState<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(fetchCharacterProvider(widget.id));

    return Scaffold(
      appBar:
          const PreferredSize(preferredSize: Size(56, 56), child: TopAppBar()),
      bottomNavigationBar: const BottomTabs(),
      body: provider.when(
        data: (character) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: character.id,
                  child: CachedNetworkImage(imageUrl: character.image),
                ),
                Text(character.name),
              ],
            ),
          );
        },
        error: (error, stack) => Text(stack.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
