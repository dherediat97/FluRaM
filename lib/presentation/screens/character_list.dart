import 'package:fluram/presentation/view_models/character_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterList extends ConsumerStatefulWidget {
  const CharacterList({super.key});

  @override
  ConsumerState<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends ConsumerState<CharacterList> {
  late CharacterListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(getCharactersProvider);
    provider.init();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: provider.haveData
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: provider.list.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(provider.list[index].image),
                          ),
                          title: Text(provider.list[index].name),
                          subtitle: Text(provider.list[index].location.name),
                        );
                      },
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
