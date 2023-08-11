import 'package:rick_n_morty_test/data/mappers/char_mapper.dart';
import 'package:rick_n_morty_test/data/models/api_responses/char_api_response.dart';
import 'package:rick_n_morty_test/domain/datasources/character_datasource.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';
import 'package:dio/dio.dart';

class CharacterDataSourceImpl extends CharacterDataSource {
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
}
