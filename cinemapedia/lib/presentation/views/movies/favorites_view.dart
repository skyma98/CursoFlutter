import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies =
        ref.watch(favoriteMoviesProvider).entries.map((e) => e.value).toList();

    // List<(int id, Movie peli)> listaPelis = [];

    // favoriteMovies.forEach(
    //   (key, value) {
    //     listaPelis.add((key, value));
    //   },
    // );

    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          final Movie movie = favoriteMovies[index];
          return ListTile(title: Text(movie.title));
        },
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
