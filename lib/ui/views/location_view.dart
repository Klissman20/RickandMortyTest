import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/ui/providers/initial_loading_provider.dart';
import 'package:rick_n_morty_test/ui/providers/locations/location_provider.dart';
import 'package:rick_n_morty_test/ui/widgets/location/location_list_view.dart';
import 'package:rick_n_morty_test/ui/widgets/shared/full_screen_loader.dart';

class LocationView extends ConsumerStatefulWidget {
  const LocationView({super.key});

  @override
  LocationViewState createState() => LocationViewState();
}

class LocationViewState extends ConsumerState<LocationView> {
  @override
  void initState() {
    super.initState();
    ref.read(locationsListProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final locations = ref.watch(locationsListProvider);

    return LocationListView(
      locationList: locations,
      loadNextPage: () {
        ref.read(locationsListProvider.notifier).loadNextPage();
      },
    );
  }
}
