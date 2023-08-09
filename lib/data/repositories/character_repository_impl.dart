import 'package:rick_n_morty_test/domain/datasources/character_datasource.dart';
import 'package:rick_n_morty_test/domain/respositories/character_repository.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterDataSource dataSource;

  CharacterRepositoryImpl(this.dataSource);

  @override
  Future<CharacterEntity> getCharacters() {
    return dataSource.getCharacters();
  }
}
