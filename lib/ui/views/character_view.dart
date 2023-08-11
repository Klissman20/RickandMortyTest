import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/ui/providers/characters/character_provider.dart';
import 'package:rick_n_morty_test/ui/providers/initial_loading_provider.dart';
import 'package:rick_n_morty_test/ui/widgets/character/char_list_view.dart';
import 'package:rick_n_morty_test/ui/widgets/shared/full_screen_loader.dart';

class CharacterView extends ConsumerStatefulWidget {
  const CharacterView({super.key});

  @override
  CharacterViewState createState() => CharacterViewState();
}

class CharacterViewState extends ConsumerState<CharacterView> {
  @override
  void initState() {
    super.initState();
    ref.read(characterListProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final characters = ref.watch(characterListProvider);

    return CharacterListView(
      characterList: characters,
      loadNextPage: () {
        ref.read(characterListProvider.notifier).loadNextPage();
      },
    );
  }
}
