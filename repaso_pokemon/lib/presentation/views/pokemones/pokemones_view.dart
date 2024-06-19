import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/domain/pokemon/pokemons/pokemon.dart';
import 'package:pokemon_prueba/presentation/providers/pokemon/types/pokemon_types_provider.dart';
import 'package:pokemon_prueba/presentation/providers/repositories/pokemon_repository_provider.dart';
import 'package:pokemon_prueba/presentation/providers/user/user_login_provider.dart';
import 'package:pokemon_prueba/presentation/widgets/horizontalListview/horizontal_listview.dart';

class PokemonesView extends ConsumerWidget {
  const PokemonesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userLoginProvider);
    final pokemonsTypes = ref.watch(pokemonTypesProvider);

    return Scaffold(
      body: pokemonsTypes.when(
        data: (pokemonTypes) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              final type = pokemonTypes[index].name;
              return FutureBuilder<List<Pokemon>>(
                future: ref.read(pokemonRepositoyProvider).getPokemonsByType(type, 1),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final pokemons = snapshot.data ?? [];
                    return HorizontalListview(
                      userId: userId,
                      items: pokemons,
                      title: type,
                      loadNextPage: () {},
                    );
                  } else {
                    return const Center(child: Text('No data'));
                  }
                },
              );
            },
          );

          //return ListView.builder(
          //  itemCount: pokemonTypes.length,
          //  itemBuilder: (BuildContext context, int index) {
          //    final pokemons = ref.read(pokemonRepositoyProvider).getPokemonsByType(pokemonTypes[index].name);
          //    listaPokemons = [...listaPokemons, []];
//
          //    return HorizontalListview(
          //      userId: userId,
          //      items: const [],
          //      title: pokemonTypes[index].name,
          //      loadNextPage: () {},
          //    );
          //  },
          //);
        },
        error: (error, stackTrace) => throw UnimplementedError(),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
