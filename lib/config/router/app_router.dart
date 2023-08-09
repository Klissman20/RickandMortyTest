import 'package:go_router/go_router.dart';
import 'package:rick_n_morty_test/ui/screens/character_screen.dart';
import 'package:rick_n_morty_test/ui/screens/location_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: CharacterScreen.name,
      path: '/',
      builder: (context, state) => const CharacterScreen()),
  GoRoute(
      name: LocationScreen.name,
      path: '/locations',
      builder: (context, state) => const LocationScreen()),
]);
