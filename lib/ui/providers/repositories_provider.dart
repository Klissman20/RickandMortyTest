//este repositorio es inmutable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_n_morty_test/data/datasources/character_datasource_impl.dart';
import 'package:rick_n_morty_test/data/repositories/character_repository_impl.dart';

final repositoryProvider = Provider((ref) {
  return RepositoryImpl(DataSourceImpl());
});
