import 'package:rick_n_morty_test/data/mappers/char_mapper.dart';
import 'package:rick_n_morty_test/data/mappers/episode_mapper.dart';
import 'package:rick_n_morty_test/data/mappers/location_mapper.dart';
import 'package:rick_n_morty_test/data/models/api_responses/char_api_response.dart';
import 'package:rick_n_morty_test/data/models/api_responses/episode_api_response.dart';
import 'package:rick_n_morty_test/data/models/api_responses/location_api_response.dart';
import 'package:rick_n_morty_test/domain/datasources/character_datasource.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';
import 'package:dio/dio.dart';
import 'package:rick_n_morty_test/domain/entities/episode_entity.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';

class DataSourceImpl extends DataSource {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  List<CharacterEntity> _jsonToCharacter(Map<String, dynamic> json) {
    final charDBResponse = CharacterApiResponse.fromJson(json);
    final List<CharacterEntity> characters = charDBResponse.results
        .map((characterdb) => CharacterMapper.characterDbToEntity(characterdb))
        .toList();
    return characters;
  }

  @override
  Future<List<CharacterEntity>> getCharacters({int page = 1}) async {
    final response =
        await dio.get('/character', queryParameters: {'page': page});

    return _jsonToCharacter(response.data);
  }

  List<LocationEntity> _jsonToLocation(Map<String, dynamic> json) {
    final locationDBResponse = LocationApiResponse.fromJson(json);
    final List<LocationEntity> locations = locationDBResponse.results
        .map((locationdb) => LocationMapper.locationDbToEntity(locationdb))
        .toList();
    return locations;
  }

  @override
  Future<List<LocationEntity>> getLocations({int page = 1}) async {
    final response =
        await dio.get('/location', queryParameters: {'page': page});

    return _jsonToLocation(response.data);
  }

  List<EpisodeEntity> _jsonToEpisodes(Map<String, dynamic> json) {
    final episodeDBResponse = EpisodeApiResponse.fromJson(json);
    final List<EpisodeEntity> episodes = episodeDBResponse.results
        .map((episodedb) => EpisodeMapper.episodeDbToEntity(episodedb))
        .toList();
    return episodes;
  }

  @override
  Future<List<EpisodeEntity>> getEpisodes({int page = 1}) async {
    final response = await dio.get('/episode', queryParameters: {'page': page});

    return _jsonToEpisodes(response.data);
  }
}
