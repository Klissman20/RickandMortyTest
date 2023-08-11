import 'package:rick_n_morty_test/domain/entities/char_entity.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';

abstract class Repository {
  Future<List<CharacterEntity>> getCharacters();
  Future<List<LocationEntity>> getLocations();
}
