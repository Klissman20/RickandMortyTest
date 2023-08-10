import 'package:rick_n_morty_test/domain/entities/char_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacters();
}
