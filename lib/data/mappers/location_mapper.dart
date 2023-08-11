import 'package:rick_n_morty_test/data/models/location_model.dart';
import 'package:rick_n_morty_test/domain/entities/location_entity.dart';

class LocationMapper {
  static LocationEntity locationDbToEntity(LocationModel location) =>
      LocationEntity(
          id: location.id,
          name: location.name,
          type: location.type,
          dimension: location.dimension,
          residents: location.residents,
          url: location.url,
          created: location.created);
}
