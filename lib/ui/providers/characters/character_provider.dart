import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';
import 'package:rick_n_morty_test/ui/providers/characters/character_repository_provider.dart';

final characterListProvider =
    StateNotifierProvider<CharacterNotifier, List<CharacterEntity>>((ref) {
  final fetchMoreCharacters = ref.watch(movieRepositoryProvider).getCharacters;
  return CharacterNotifier(fetchMoreChars: fetchMoreCharacters);
});

typedef CharacterCallback = Future<List<CharacterEntity>> Function({int page});

class CharacterNotifier extends StateNotifier<List<CharacterEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  CharacterCallback fetchMoreChars;

  CharacterNotifier({required this.fetchMoreChars}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<CharacterEntity> characters =
        await fetchMoreChars(page: currentPage);
    state = [...state, ...characters];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
