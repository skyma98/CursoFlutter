import 'package:pokemon_prueba/domain/pokemon/pokemons/pokemon.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/model/pokemon_response.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/model/pokemon_types_response.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/mappers/ability_mapper.dart';

class PokemonMapper {
  static PokemonType convert(PokemonTypeResult pokemonTypeResult) {
    return PokemonType(
      url: pokemonTypeResult.url,
      name: pokemonTypeResult.name,
    );
  }

  static PokemonType convertType(TypeResponse typeResponse) {
    return PokemonType(
      url: typeResponse.type.url ?? '',
      name: typeResponse.type.name ?? '',
    );
  }

  static Pokemon convertPokemon(PokemonResponse pokemonResponse) {
    return Pokemon(
      name: pokemonResponse.name ?? '',
      height: pokemonResponse.height,
      weight: pokemonResponse.weight,
      id: pokemonResponse.id,
      abilities: pokemonResponse.abilities.map((e) => AbilityMapper.convert(e)).toList(),
      urlImage: pokemonResponse.sprites.frontDefault ?? '',
      types: pokemonResponse.types.map((e) => convertType(e)).toList(),
    );
  }
}
