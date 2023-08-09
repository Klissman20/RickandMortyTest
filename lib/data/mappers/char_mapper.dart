import 'package:rick_n_morty_test/data/models/char_model.dart';
import 'package:rick_n_morty_test/domain/entities/char_entity.dart';

class CharacterMapper {
  static CharacterEntity characterDbToEntity(CharacterModel character) =>
      CharacterEntity(
          id: character.id,
          name: character.name,
          status: character.status,
          species: character.species,
          type: character.type,
          gender: character.gender,
          origin: character.origin,
          location: character.location,
          image: character.image,
          episode: character.episode,
          url: character.url,
          created: character.created);
}
