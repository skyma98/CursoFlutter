import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';
import 'package:pokemon_prueba/presentation/providers/repositories/pokemon_repository_provider.dart';

final pokemonTypesProvider = FutureProvider<List<PokemonType>>(
  (ref) async {
    final pokemonTypeRepository = ref.read(pokemonRepositoyProvider);
    return await pokemonTypeRepository.getPokemonTypes();
  },
);
