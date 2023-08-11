import 'package:rick_n_morty_test/data/models/episode_model.dart';
import 'package:rick_n_morty_test/domain/entities/episode_entity.dart';

class EpisodeMapper {
  static EpisodeEntity episodeDbToEntity(EpisodeModel episode) => EpisodeEntity(
      id: episode.id,
      name: episode.name,
      airDate: episode.airDate,
      episode: episode.episode,
      characters: episode.characters,
      url: episode.url,
      created: episode.created);
}
