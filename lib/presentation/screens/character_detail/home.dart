import 'package:fluram/presentation/view_models/character_notifier.dart';
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
      body: provider.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [Text(data.name)],
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
