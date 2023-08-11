import 'package:go_router/go_router.dart';
import 'package:rick_n_morty_test/ui/screens/home_screen.dart';
import 'package:rick_n_morty_test/ui/views/character_view.dart';
import 'package:rick_n_morty_test/ui/views/episode_view.dart';
import 'package:rick_n_morty_test/ui/views/location_view.dart';

final appRouter = GoRouter(initialLocation: '/character', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/character',
          builder: (context, state) {
            return const CharacterView();
          },
        ),
        GoRoute(
          path: '/location',
          builder: (context, state) {
            return const LocationView();
          },
        ),
        GoRoute(
          path: '/episodes',
          builder: (context, state) {
            return const EpisodeView();
          },
        ),
      ])
  // GoRoute(
  //     name: CharacterScreen.name,
  //     path: '/',
  //     builder: (context, state) =>
  //         const CharacterScreen(childView: CharacterView())),
  // GoRoute(
  //     name: LocationScreen.name,
  //     path: '/locations',
  //     builder: (context, state) => const LocationScreen()),
]);
