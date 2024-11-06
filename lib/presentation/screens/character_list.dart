import 'package:fluram/presentation/view_models/character_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterList extends ConsumerWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(fetchAllCharactersProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: provider.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: data.results.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.network(
                        data.results[index].image,
                      ),
                    ),
                    title: Text(data.results[index].name),
                    subtitle: Text(data.results[index].location.name),
                  );
                },
              )
            ],
          ),
        ),
        error: (error, stack) => const Text("error"),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      )),
    );
  }
}
