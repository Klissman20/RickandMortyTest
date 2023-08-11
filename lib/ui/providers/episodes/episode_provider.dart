import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/domain/entities/episode_entity.dart';
import 'package:rick_n_morty_test/ui/providers/repositories_provider.dart';

final episodesListProvider =
    StateNotifierProvider<EpisodeNotifier, List<EpisodeEntity>>((ref) {
  final fetchMoreEpisodes = ref.watch(repositoryProvider).getEpisodes;
  return EpisodeNotifier(fetchMoreData: fetchMoreEpisodes);
});

typedef EpisodeCallback = Future<List<EpisodeEntity>> Function({int page});

class EpisodeNotifier extends StateNotifier<List<EpisodeEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  EpisodeCallback fetchMoreData;

  EpisodeNotifier({required this.fetchMoreData}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<EpisodeEntity> locations =
        await fetchMoreData(page: currentPage);
    state = [...state, ...locations];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
