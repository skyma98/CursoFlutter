import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/pokemon_datasource.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/repository/pokemon_repository.dart';

final pokemonRepositoyProvider = Provider(
  (ref) {
    return PokemonRepository(pokemonDatasource: PokemonDatasource());
  },
);
