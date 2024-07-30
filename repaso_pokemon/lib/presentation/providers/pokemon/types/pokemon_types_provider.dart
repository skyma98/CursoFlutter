import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';
import 'package:pokemon_prueba/presentation/providers/repositories/pokemon_repository_provider.dart';

final pokemonTypesProvider = FutureProvider<Map<PokemonType, int>>(
  (ref) async {
    final pokemonTypeRepository = ref.read(pokemonRepositoyProvider);
    final tipos = await pokemonTypeRepository.getPokemonTypes();
    return {for (var e in tipos) e: 1};
  },
);
