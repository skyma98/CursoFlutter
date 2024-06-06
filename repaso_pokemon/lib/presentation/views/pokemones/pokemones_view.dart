import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/presentation/providers/pokemon/types/pokemon_types_provider.dart';
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
            itemCount: pokemonTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return HorizontalListview(
                userId: userId,
                items: const [],
                title: pokemonTypes[index].name,
                loadNextPage: () {},
              );
            },
          );
        },
        error: (error, stackTrace) => throw UnimplementedError(),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
