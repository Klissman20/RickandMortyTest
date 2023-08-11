import 'package:rick_n_morty_test/domain/datasources/character_datasource.dart';
import 'package:rick_n_morty_test/domain/entities/episode_entity.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';
import 'package:rick_n_morty_test/domain/respositories/character_repository.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';

class RepositoryImpl extends Repository {
  final DataSource dataSource;

  RepositoryImpl(this.dataSource);

  @override
  Future<List<CharacterEntity>> getCharacters({int page = 1}) {
    return dataSource.getCharacters(page: page);
  }

  @override
  Future<List<LocationEntity>> getLocations({int page = 1}) {
    return dataSource.getLocations(page: page);
  }

  @override
  Future<List<EpisodeEntity>> getEpisodes({int page = 1}) {
    return dataSource.getEpisodes(page: page);
  }
}
