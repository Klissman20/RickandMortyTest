import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/ui/providers/characters/character_provider.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step = ref.watch(characterListProvider).isEmpty;
  if (step) return true;
  return false;
});
