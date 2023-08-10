import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/ui/providers/characters/character_provider.dart';
import 'package:rick_n_morty_test/ui/providers/initial_loading_provider.dart';
import 'package:rick_n_morty_test/ui/widgets/char_list_view.dart';
import 'package:rick_n_morty_test/ui/widgets/custom_app_bar.dart';
import 'package:rick_n_morty_test/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:rick_n_morty_test/ui/widgets/full_screen_loader.dart';

class CharacterScreen extends StatelessWidget {
  static const name = 'character-screen';
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(flexibleSpace: const CustomAppBar()),
        body: const _CharacterView(),
        bottomNavigationBar: const CustomBottomNavigaton());
  }
}

class _CharacterView extends ConsumerStatefulWidget {
  const _CharacterView();

  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends ConsumerState<_CharacterView> {
  @override
  void initState() {
    super.initState();
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
