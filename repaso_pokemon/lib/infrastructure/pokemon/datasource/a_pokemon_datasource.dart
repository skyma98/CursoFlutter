import 'package:pokemon_prueba/domain/pokemon/pokemons/pokemon.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';

abstract class APokemonDatasource {
  Future<List<PokemonType>> getPokemonTypes();
  Future<List<Future<Pokemon>>> getPokemonsByType(int type);
  Future<Pokemon> getPokemon(String url);
}
