import 'package:dio/dio.dart';
import 'package:pokemon_prueba/domain/pokemon/pokemons/pokemon.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/a_pokemon_datasource.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/model/pokemon_response.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/model/pokemon_types_response.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/model/pokemons_by_types_response.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/mappers/pokemon_mapper.dart';

class PokemonDatasource implements APokemonDatasource {
  @override
  Future<List<PokemonType>> getPokemonTypes() async {
    final dio = Dio();

    final result = await dio.get('https://pokeapi.co/api/v2/type/');

    if (result.statusCode! < 200 || result.statusCode! >= 300) {
      throw UnimplementedError();
    }

    final data = result.data;
    final pokemonTypeResponse = PokemonTypes.fromJson(data);

    final types = pokemonTypeResponse.results.map((e) => PokemonMapper.convert(e)).toList();

    return types;
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type, int page) async {
    if (page <= 0) {
      return [];
    }

    final dio = Dio();

    final result = await dio.get('https://pokeapi.co/api/v2/type/$type');

    if (result.statusCode! < 200 || result.statusCode! >= 300) {
      throw UnimplementedError();
    }

    final data = result.data;

    final pokemonResponse = PokemonsByTypes.fromJson(data);

    final pokemones = pokemonResponse.pokemon;

    const int limit = 5;

    final int startIndex = (page - 1) * limit;
    int endIndex = startIndex - 1 + limit;

    if (startIndex > pokemones.length) {
      return [];
    }

    if (endIndex > pokemones.length) {
      endIndex = pokemones.length;
    }

    final pokemonsResponse = pokemonResponse.pokemon.sublist(startIndex, endIndex);

    final pokemonResult = await Future.wait(pokemonsResponse.map(
      (e) async {
        return await getPokemon(e.pokemon.url);
      },
    ));

    return pokemonResult;
  }

  @override
  Future<Pokemon> getPokemon(String url) async {
    final dio = Dio();

    final result = await dio.get(url);

    if (result.statusCode! < 200 || result.statusCode! >= 300) {
      throw UnimplementedError();
    }

    final data = result.data;

    final pokemonResponse = PokemonResponse.fromJson(data);

    final pokemon = PokemonMapper.convertPokemon(pokemonResponse);

    return pokemon;
  }
}
