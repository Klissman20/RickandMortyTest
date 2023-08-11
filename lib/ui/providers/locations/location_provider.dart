import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';
import 'package:rick_n_morty_test/ui/providers/repositories_provider.dart';

final locationsListProvider =
    StateNotifierProvider<LocationNotifier, List<LocationEntity>>((ref) {
  final fetchMoreLocations = ref.watch(repositoryProvider).getLocations;
  return LocationNotifier(fetchMoreData: fetchMoreLocations);
});

typedef LocationCallback = Future<List<LocationEntity>> Function({int page});

class LocationNotifier extends StateNotifier<List<LocationEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  LocationCallback fetchMoreData;

  LocationNotifier({required this.fetchMoreData}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<LocationEntity> locations =
        await fetchMoreData(page: currentPage);
    state = [...state, ...locations];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
