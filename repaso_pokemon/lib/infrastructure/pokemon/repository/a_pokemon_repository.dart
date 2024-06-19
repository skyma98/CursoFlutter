import 'package:pokemon_prueba/domain/pokemon/pokemons/pokemon.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';

abstract class APokemonRepository {
  Future<List<PokemonType>> getPokemonTypes();
  Future<List<Pokemon>> getPokemonsByType(String type, int page);
  Future<Pokemon> getPokemon(String url);
}
