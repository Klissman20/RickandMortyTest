import 'package:rick_n_morty_test/domain/entities/char_entity.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';

abstract class DataSource {
  Future<List<CharacterEntity>> getCharacters({int page});
  Future<List<LocationEntity>> getLocations({int page});
}
