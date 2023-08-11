import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/ui/providers/episodes/episode_provider.dart';
import 'package:rick_n_morty_test/ui/providers/initial_loading_provider.dart';
import 'package:rick_n_morty_test/ui/widgets/episode/episode_list_view.dart';
import 'package:rick_n_morty_test/ui/widgets/shared/full_screen_loader.dart';

class EpisodeView extends ConsumerStatefulWidget {
  const EpisodeView({super.key});

  @override
  EpisodeViewState createState() => EpisodeViewState();
}

class EpisodeViewState extends ConsumerState<EpisodeView> {
  @override
  void initState() {
    super.initState();
    ref.read(episodesListProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final episodes = ref.watch(episodesListProvider);

    return EpisodeListView(
      episodeList: episodes,
      loadNextPage: () {
        ref.read(episodesListProvider.notifier).loadNextPage();
      },
    );
  }
}
