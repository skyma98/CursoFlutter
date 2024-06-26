import 'package:pokemon_prueba/domain/pokemon/pokemons/pokemon.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/a_pokemon_datasource.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/repository/a_pokemon_repository.dart';

class PokemonRepository implements APokemonRepository {
  final APokemonDatasource pokemonDatasource;

  PokemonRepository({required this.pokemonDatasource});

  @override
  Future<List<PokemonType>> getPokemonTypes() {
    return pokemonDatasource.getPokemonTypes();
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type, int page) {
    return pokemonDatasource.getPokemonsByType(type, page);
  }

  @override
  Future<Pokemon> getPokemon(String url) {
    return pokemonDatasource.getPokemon(url);
  }
}
